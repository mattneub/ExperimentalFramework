import UIKit
import URLNavigator
import Swinject
import SwinjectAutoregistration

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

// prep the navigator; it needs to live somewhere...
// and it needs to be initialized so that URLs are registered
let navigator = Navigator()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let registrar = Registrar()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        URLNavigationMap.initialize(navigator: navigator)
        self.registrar.doSwinjectRegistration()
        
        return true
    }
}


