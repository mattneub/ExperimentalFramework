import UIKit
import Swinject
import SwinjectAutoregistration

final class NextWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        // boilerplate, I don't see how to remove this because we might have other tasks in our `init`...
        // but at least it's darned compact now
        let view: NextViewController = container~>
        super.init(viewController: view)
        view.presenter = container ~> (NextPresenter.self, argument: self)
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
