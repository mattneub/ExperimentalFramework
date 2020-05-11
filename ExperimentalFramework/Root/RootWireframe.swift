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
// okay, let's talk about the problem of passing info back and forth between modules
// without further modification, we are already receiving the view controller
// well, that means we can access its presenter and hand it stuff
// one downside: we have to know where we're going (in order to type the v.c./presenter)
// but I see no way around that! at some point, we have to know the type of _something_
extension RootWireframe: RouterDelegate {
    func present(_ target: UIViewController, animated: Bool) {
        if let target = target as? NextViewController, let targetPresenter = target.presenter {
            targetPresenter.oldUsername = (self.viewController as? RootViewController)?
                .presenter?.username
            (self.viewController as? RootViewController)?
                .presenter?.trackUsername(targetPresenter.$username.eraseToAnyPublisher())
        }
        self.viewController.present(target, animated:animated)
    }
    func push(_ target: UIViewController, animated: Bool) {
        if let target = target as? NextViewController, let targetPresenter = target.presenter {
            targetPresenter.oldUsername = (self.viewController as? RootViewController)?
                .presenter?.username
            (self.viewController as? RootViewController)?
                .presenter?.trackUsername(targetPresenter.$username.eraseToAnyPublisher())
        }
        self.viewController.navigationController?.pushViewController(target, animated: true)
    }
}
