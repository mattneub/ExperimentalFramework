import UIKit
import URLNavigator
import Swinject
import SwinjectAutoregistration

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
        // greatly reduce boilerplate by using autoregister
        // let's clump "same" types together, as order is irrelevant
        
        container.autoregister(RootViewController.self, initializer: RootViewController.init(nibName:bundle:))
        container.autoregister(NextViewController.self, initializer: NextViewController.init(nibName:bundle:))

        container.autoregister(RootInteractor.self, initializer: RootInteractor.init)
        container.autoregister(NextInteractor.self, initializer: NextInteractor.init)

        container.autoregister(RootPresenter.self, argument: RootWireframe.self, initializer: RootPresenter.init)
        container.autoregister(NextPresenter.self, argument: NextWireframe.self, initializer: NextPresenter.init)
        
        // boilerplate moved back to wireframe inits
        container.autoregister(RootWireframe.self, initializer: RootWireframe.init)
        container.autoregister(NextWireframe.self, initializer: NextWireframe.init)

    }
}


