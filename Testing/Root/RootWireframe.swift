import UIKit

final class RootWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    // no `init` needed, unless we have private properties to configure
    // the container registration calls our superclass's `init(viewController:)` as required
}

// MARK: - Extensions -

// using RouterDelegate means we both request root and perform navigation
// that seems the right division of labor
extension RootWireframe: RootWireframeInterface {
    func navigateFromRootToNextVC() {
        Router(from: self).goto(.next)
    }
}
extension RootWireframe: RouterDelegate {
    func present(_ target: UIViewController, animated: Bool) {
        self.viewController.present(target, animated:animated)
    }
}
