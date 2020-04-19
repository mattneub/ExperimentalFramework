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

extension RootWireframe: RootWireframeInterface {
}
