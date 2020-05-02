import Foundation

final class NextPresenter: BasePresenter {

    // MARK: - Private properties -

    // boilerplate
    private unowned let view: NextViewInterface
    private let interactor: NextInteractorInterface
    private let wireframe: NextWireframeInterface

    // MARK: - Lifecycle -
    // boilerplate, slightly altered:
    // initializer has to be changed from template, to specify actual types
    // ... so that we can autoregister
    init(view: NextViewController, interactor: NextInteractor, wireframe: NextWireframe) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

// actual presenter work
extension NextPresenter: NextPresenterInterface {
    func userWantsToNavigateBack() {
        self.wireframe.navigateBack()
    }
    
}
