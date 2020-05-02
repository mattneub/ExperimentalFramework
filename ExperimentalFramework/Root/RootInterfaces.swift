import UIKit

protocol RootWireframeInterface: WireframeInterface {
    func navigateToNextVCByPresenting()
    func navigateToNextVCByPushing()
}

protocol RootViewInterface: ViewInterface {
}

protocol RootPresenterInterface: PresenterInterface {
    func userWantsToPresent()
    func userWantsToPush()
}

protocol RootInteractorInterface: InteractorInterface {
}
