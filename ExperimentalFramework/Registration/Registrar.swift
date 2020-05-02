import Foundation
import Swinject
import SwinjectAutoregistration

// create the swinject container
let swinjectContainer = Container()

struct Registrar {
    func doSwinjectRegistration() {
        // greatly reduce boilerplate by using autoregister
        // let's clump "same" types together, as order is irrelevant
        
        swinjectContainer.autoregister(
            RootViewController.self, initializer: RootViewController.init(nibName:bundle:))
        swinjectContainer.autoregister(
            NextViewController.self, initializer: NextViewController.init(nibName:bundle:))

        swinjectContainer.autoregister(
            RootInteractor.self, initializer: RootInteractor.init)
        swinjectContainer.autoregister(
            NextInteractor.self, initializer: NextInteractor.init)

        swinjectContainer.autoregister(
            RootPresenter.self, argument: RootWireframe.self, initializer: RootPresenter.init)
        swinjectContainer.autoregister(
            NextPresenter.self, argument: NextWireframe.self, initializer: NextPresenter.init)
        
        swinjectContainer.autoregister(
            RootWireframe.self, initializer: RootWireframe.init)
        swinjectContainer.autoregister(
            NextWireframe.self, initializer: NextWireframe.init)

    }
}

