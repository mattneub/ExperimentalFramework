import UIKit

final class NextWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    // no `init` needed, unless we have private properties to configure
    // the container registration calls our superclass's `init(viewController:)` as required
}

// MARK: - Extensions -

// using RouterDelegate means we both request root and perform navigation
// that seems the right division of labor
extension NextWireframe: NextWireframeInterface {
    func navigateBack() {
        Router(from: self).goto(.backToRoot)
    }
}
extension NextWireframe: RouterDelegate {
    func dismiss(animated: Bool) {
        viewController.dismiss(animated: animated)
    }
}
