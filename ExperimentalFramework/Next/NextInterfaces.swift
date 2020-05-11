

import UIKit

protocol NextWireframeInterface: WireframeInterface {
    func navigateBack()
}

protocol NextViewInterface: ViewInterface {
}

protocol NextPresenterInterface: PresenterInterface {
    func userWantsToNavigateBack()
    func userTypedInTextField(_:String)
}

protocol NextInteractorInterface: InteractorInterface {
}
