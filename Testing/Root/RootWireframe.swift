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
    
    // navigation is like the start: make a wireframe and "present" the wireframe
    func navigateFromRootToNextVC() {
        let wireframe = NextWireframe()
        self.viewController.presentWireframe(wireframe)
    }
    
}
