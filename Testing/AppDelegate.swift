import UIKit
import URLNavigator
import Swinject

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

// prep the navigator; it needs to live somewhere...
// and it needs to be initialized so that URLs are registered
let navigator = Navigator()

// create the swinject container
let container = Container()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        URLNavigationMap.initialize(navigator: navigator)
        self.doSwinjectRegistration()
        return true
    }
    private func doSwinjectRegistration() {
        container.register(RootViewController.self) { _ in
            return RootViewController()
        }
        container.register(RootInteractor.self) { _ in
            return RootInteractor()
        }
        container.register(RootPresenter.self) { (resolver, wireframe: RootWireframe) in
            let view = resolver.resolve(RootViewController.self)!
            let interactor = resolver.resolve(RootInteractor.self)!
            return RootPresenter(view: view, interactor: interactor, wireframe: wireframe)
        }
        container.register(RootWireframe.self) { resolver in
            // the repetition of `view` resolution doesn't matter! we have `.graph` scope by default...
            // ...so in fact there will be only one instance created (and I can prove it)
            let view = resolver.resolve(RootViewController.self)!
            let wireframe = RootWireframe.init(viewController: view)
            let presenter = resolver.resolve(RootPresenter.self, argument: wireframe)
            view.presenter = presenter
            return wireframe
        }
        
        container.register(NextViewController.self) { _ in
            return NextViewController()
        }
        container.register(NextInteractor.self) { _ in
            return NextInteractor()
        }
        container.register(NextPresenter.self) { (resolver, wireframe: NextWireframe) in
            let view = resolver.resolve(NextViewController.self)!
            let interactor = resolver.resolve(NextInteractor.self)!
            return NextPresenter(view: view, interactor: interactor, wireframe: wireframe)
        }
        container.register(NextWireframe.self) { resolver in
            // the repetition of `view` resolution doesn't matter! we have `.graph` scope by default...
            // ...so in fact there will be only one instance created
            let view = resolver.resolve(NextViewController.self)!
            let wireframe = NextWireframe.init(viewController: view)
            let presenter = resolver.resolve(NextPresenter.self, argument: wireframe)
            view.presenter = presenter
            return wireframe
        }

    }
}


