import Foundation

final class RootPresenter {

    // MARK: - Private properties -

    private unowned let view: RootViewInterface
    private let interactor: RootInteractorInterface
    private let wireframe: RootWireframeInterface

    // MARK: - Lifecycle -
    // Note! initializer has to be changed from template, to specify actual types, so we can autoregister
    init(view: RootViewController, interactor: RootInteractor, wireframe: RootWireframe) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension RootPresenter: RootPresenterInterface {
    func userWantsToNavigate() {
        self.wireframe.navigateFromRootToNextVC()
    }
    
}
