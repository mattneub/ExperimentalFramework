import UIKit
import Combine

protocol RootWireframeInterface: WireframeInterface {
    func navigateToNextVCByPresenting()
    func navigateToNextVCByPushing()
}

protocol RootViewInterface: ViewInterface {
    func newUsername(_:String)
}

protocol RootPresenterInterface: PresenterInterface {
    func userWantsToPresent()
    func userWantsToPush()
    func trackUsername(_ publisher: AnyPublisher<String,Never>)
}

protocol RootInteractorInterface: InteractorInterface {
}
