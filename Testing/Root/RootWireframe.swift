import UIKit

final class RootWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = RootViewController()
        super.init(viewController: moduleViewController)

        let interactor = RootInteractor()
        let presenter = RootPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

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
