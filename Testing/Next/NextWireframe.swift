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

extension NextWireframe: NextWireframeInterface {
}
