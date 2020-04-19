

import UIKit

protocol NextWireframeInterface: WireframeInterface {
}

protocol NextViewInterface: ViewInterface {
    func dismissYourself()
}

protocol NextPresenterInterface: PresenterInterface {
    func userWantsToNavigateBack()
}

protocol NextInteractorInterface: InteractorInterface {
}
