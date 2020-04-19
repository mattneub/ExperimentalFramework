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
    
    func navigateFromRootToNextVC() {
        // use navigator to get next vc
        if let vc = navigator.viewController(for: "testing://next") {
            self.viewController.present(vc, animated: true)
        }
        // alternatively we can ask the navigator to just do it
        // navigator.present("testing://next")
    }
    
}
