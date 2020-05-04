import Foundation

final class RootPresenter: BasePresenter {

    // MARK: - Private properties -

    // boilerplate
    private unowned let view: RootViewInterface
    private let interactor: RootInteractorInterface
    private let wireframe: RootWireframeInterface
    
    var userName = ""

    // MARK: - Lifecycle -
    
    // boilerplate, slightly altered:
    // initializer has to be changed from template, to specify actual types
    // ... so that we can autoregister
    init(view: RootViewController, interactor: RootInteractor, wireframe: RootWireframe) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

// actual presenter work!
extension RootPresenter: RootPresenterInterface {
    func userWantsToPresent() {
        self.wireframe.navigateToNextVCByPresenting()
    }
    func userWantsToPush() {
        self.wireframe.navigateToNextVCByPushing()
    }
}
