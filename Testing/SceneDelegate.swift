import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { fatalError("arg") }
        self.window = UIWindow(windowScene: scene)
        // use URLNavigator to get vc
        if let vc = navigator.viewController(for: "testing://root") {
            self.window?.rootViewController = vc
        }
        self.window?.makeKeyAndVisible()
    }



}

