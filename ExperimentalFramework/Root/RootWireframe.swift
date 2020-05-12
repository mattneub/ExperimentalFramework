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

// okay, let's talk about the problem of passing info back and forth between modules
// without further modification, we are already receiving the view controller
// well, that means we can access its presenter and hand it stuff
// and we have our presenter, so we can connect the two

// one downside: we have to know where we're going (in order to type the v.c./presenter)
// but I see no way around that! at some point, we have to know the type of _something_
// the way we get at the presenters may seem roundabout...
// but attempting to short-circuit this with actual properties is a good way to leak, so let's not

// looks silly because for purposes of the example I am presenting and pushing the same v.c.
// in real life that wouldn't happen
// but you'd just always do this dance:
// get the target's presenter, get my presenter, hook them together as desired, and navigate

extension RootWireframe: RouterDelegate {
    func present(_ target: UIViewController, animated: Bool) {
        let targPresenter: NextPresenter = target.presenter()
        let myPresenter: RootPresenter = self.viewController.presenter()
        targPresenter.username = myPresenter.username
        myPresenter.trackUsername(targPresenter.$username.eraseToAnyPublisher())
        self.viewController.present(target, animated:animated)
    }
    func push(_ target: UIViewController, animated: Bool) {
        let targPresenter: NextPresenter = target.presenter()
        let myPresenter: RootPresenter = self.viewController.presenter()
        targPresenter.username = myPresenter.username
        myPresenter.trackUsername(targPresenter.$username.eraseToAnyPublisher())
        self.viewController.navigationController?.pushViewController(target, animated: true)
    }
}

