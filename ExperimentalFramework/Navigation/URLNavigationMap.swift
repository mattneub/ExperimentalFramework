import Foundation
import URLNavigator
import Swinject
import SwinjectAutoregistration

// URL navigation is nice, but enums are nicer than URLs
// translate enum case to URL
extension NavigatorType {
    func register(_ route: Route, _ factory: @escaping ViewControllerFactory) {
        self.register(route.rawValue, factory)
    }
    func handle(_ route: Route, _ factory: @escaping URLOpenHandlerFactory) {
        self.handle(route.rawValue, factory)
    }
    func open(_ route: Route, context: Any? = nil) -> Bool {
        self.open(route.rawValue, context: context)
    }
}

// `handle` makes handler that responds to `open`

// our job here is: create the next wireframe and view controller...
// and pass the view controller as target back to delegate

// our choice of method tells the delegate what to do

// here we assume that the context _is_ the delegate...
// but we could receive anything really

// I'm doing a little experiment here where I keep track of the current route
// my idea is that this could make it simpler to "unwind" just like Apple does it

enum URLNavigationMap {
    private static var _currentRoute: URLConvertible?
    static var currentRoute: URLConvertible? {_currentRoute}
    static func initialize(navigator: NavigatorType) {
        navigator.handle(.root) {
            url, values, context in
            if let source = context as? RouterDelegate {
                let wireframe: RootWireframe = swinjectContainer~>
                let nav = UINavigationController(rootViewController: wireframe.viewController)
                source.replaceRootViewController(nav)
                self._currentRoute = url
                return true
            }
            return false
        }
//        navigator.register(.rootNextByPresenting) {
//            url, values, context in
//            if let source = context as? RouterDelegate {
//                let wireframe: RootWireframe = swinjectContainer~>
//                let nav = UINavigationController(rootViewController: wireframe.viewController)
//                source.replaceRootViewController(nav)
//                self._currentRoute = url
//                return wireframe.viewController
//            }
//            return nil
//        }
//        navigator.register(.rootNextByPushing) {
//            url, values, context in
//            if let source = context as? RouterDelegate {
//                let wireframe: NextWireframe = swinjectContainer~>
//                source.push(wireframe.viewController, animated: true)
//                self._currentRoute = url
//                return wireframe.viewController
//            }
//            return nil
//        }
        navigator.handle(.rootNextByPresenting) {
            url, values, context in
            if let source = context as? RouterDelegate {
                let wireframe: NextWireframe = swinjectContainer~>
                source.present(wireframe.viewController, animated: true)
                self._currentRoute = url
                return true
            }
            return false
        }
        navigator.handle(.rootNextByPushing) {
            url, values, context in
            if let source = context as? RouterDelegate {
                let wireframe: NextWireframe = swinjectContainer~>
                source.push(wireframe.viewController, animated: true)
                self._currentRoute = url
                return true
            }
            return false
        }
        navigator.handle(.backToRoot) {
            url, values, context in
            (context as? RouterDelegate)?.dismiss(animated: true)
            self._currentRoute = url
            return true
        }
    }
}

