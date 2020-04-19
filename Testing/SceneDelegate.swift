import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { fatalError("arg") }
        self.window = UIWindow(windowScene: scene)
        // instead of applying a view controller directly, make a wireframe first
        let wireframe = RootWireframe()
        self.window?.rootViewController = wireframe.viewController
        self.window?.makeKeyAndVisible()
    }



}

