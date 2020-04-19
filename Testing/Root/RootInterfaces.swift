import UIKit

protocol RootWireframeInterface: WireframeInterface {
    func navigateFromRootToNextVC()
}

protocol RootViewInterface: ViewInterface {
}

protocol RootPresenterInterface: PresenterInterface {
    func userWantsToNavigate()
}

protocol RootInteractorInterface: InteractorInterface {
}
