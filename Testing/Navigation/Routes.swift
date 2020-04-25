import UIKit

// cases instead of URLs
enum Route : String {
    case root = "testing://root"
    case rootNext = "testing://root/next"
    case backToRoot = "testing://backToRoot"
}

// by writing the delegate this way, we make the methods effectively optional
protocol RouterDelegate {
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
    func replaceRootViewController(_ viewController: UIViewController)
}
extension RouterDelegate {
    func present(_ viewController: UIViewController, animated: Bool) {
        fatalError("unimplemented RouterDelegate method")
    }
    func dismiss(animated: Bool) {
        fatalError("unimplemented RouterDelegate method")
    }
    func replaceRootViewController(_ viewController: UIViewController) {
        fatalError("unimplemented RouterDelegate method")
    }
}

// lightweight object, requires a source that can be called back and told what to do
// we pass the source on to the navigator, the navigator calls the source back with the target view controller
struct Router {
    let source: RouterDelegate
    init(from source: RouterDelegate) {
        self.source = source
    }
    // obviously we could make each choice be more elaborate if needed
    func goto(_ route: Route) {
        switch route {
        case .root:
            _ = navigator.open(.root, context: source)
        case .rootNext:
            _ = navigator.open(.rootNext, context: source)
        case .backToRoot:
            _ = navigator.open(.backToRoot, context: source)
        }
    }
}
