import UIKit
import Swinject
import SwinjectAutoregistration

final class RootWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        // boilerplate, adapted
        // I don't see how to remove this entirely,
        // because we might have other tasks in our `init`...
        // but at least it's darned compact now that we are using swinject
        let view: RootViewController = swinjectContainer~>
        super.init(viewController: view)
        view.presenter = swinjectContainer ~> (RootPresenter.self, argument: self)
    }
}

// MARK: - Extensions -

// using RouterDelegate means we both request root and perform navigation
// that seems the right division of labor
extension RootWireframe: RootWireframeInterface {
    func navigateToNextVCByPresenting() {
        Router(from: self).goto(.rootNextByPresenting)
    }
    
    func navigateToNextVCByPushing() {
        Router(from: self).goto(.rootNextByPushing)
    }
}

// NB this is not quite right; the templates allow us to present / push the _wireframe_...
// ...and it might be nicer to do that
extension RootWireframe: RouterDelegate {
    func present(_ target: UIViewController, animated: Bool) {
        self.viewController.present(target, animated:animated)
    }
    func push(_ target: UIViewController, animated: Bool) {
        self.viewController.navigationController?.pushViewController(target, animated: true)
    }
}
