import UIKit

final class NextWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = NextViewController()
        super.init(viewController: moduleViewController)

        let interactor = NextInteractor()
        let presenter = NextPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

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
