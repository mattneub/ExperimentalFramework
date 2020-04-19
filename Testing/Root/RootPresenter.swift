import Foundation

final class RootPresenter {

    // MARK: - Private properties -

    private unowned let view: RootViewInterface
    private let interactor: RootInteractorInterface
    private let wireframe: RootWireframeInterface

    // MARK: - Lifecycle -

    init(view: RootViewInterface, interactor: RootInteractorInterface, wireframe: RootWireframeInterface) {
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
