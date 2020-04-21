import Foundation

final class NextPresenter {

    // MARK: - Private properties -

    private unowned let view: NextViewInterface
    private let interactor: NextInteractorInterface
    private let wireframe: NextWireframeInterface

    // MARK: - Lifecycle -
    // Note! initializer has to be changed from template, to specify actual types, so we can autoregister
    init(view: NextViewController, interactor: NextInteractor, wireframe: NextWireframe) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension NextPresenter: NextPresenterInterface {
    func userWantsToNavigateBack() {
        self.wireframe.navigateBack()
    }
    
}
