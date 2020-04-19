import Foundation

final class NextPresenter {

    // MARK: - Private properties -

    private unowned let view: NextViewInterface
    private let interactor: NextInteractorInterface
    private let wireframe: NextWireframeInterface

    // MARK: - Lifecycle -

    init(view: NextViewInterface, interactor: NextInteractorInterface, wireframe: NextWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension NextPresenter: NextPresenterInterface {
    func userWantsToNavigateBack() {
        self.view.dismissYourself()
    }
    
}
