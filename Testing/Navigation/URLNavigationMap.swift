import Foundation
import URLNavigator
import Swinject
import SwinjectAutoregistration

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


enum URLNavigationMap {
  static func initialize(navigator: NavigatorType) {
    // handle makes handler that responds to `open`
    // we make the next wireframe and view controller...
    // and pass the view controller as target back to delegate
    // our choice of method tells the delegate what to do
    // here we assume that the context _is_ the delegate...
    // but we could receive anything really
    navigator.handle(.root) {
        url, values, context in
        if let source = context as? RouterDelegate {
            let wireframe: RootWireframe = container~>
            source.replaceRootViewController(wireframe.viewController)
            return true
        }
        return false
    }
    navigator.handle(.next) {
        url, values, context in
        if let source = context as? RouterDelegate {
            let wireframe: NextWireframe = container~>
            source.present(wireframe.viewController, animated: true)
            return true
        }
        return false
    }
    navigator.handle(.backToRoot) {
        url, values, context in
        (context as? RouterDelegate)?.dismiss(animated: true)
        return true
    }
  }
}

