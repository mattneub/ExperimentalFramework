import UIKit
import Swinject
import SwinjectAutoregistration

final class RootWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        // boilerplate, I don't see how to remove this because we might have other tasks in our `init`...
        // but at least it's darned compact now
        let view: RootViewController = container~>
        super.init(viewController: view)
        view.presenter = container ~> (RootPresenter.self, argument: self)
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
