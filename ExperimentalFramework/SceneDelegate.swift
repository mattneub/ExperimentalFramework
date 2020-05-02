import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { fatalError("arg") }
        self.window = UIWindow(windowScene: scene)
        
        Router(from: self).goto(.root)
    }
}

// using RouterDelegate means we both request root and perform navigation
// that seems the right division of labor
// basically the scene delegate here is acting as a kind of root wireframe
extension SceneDelegate: RouterDelegate {
    func replaceRootViewController(_ viewController: UIViewController) {
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}

