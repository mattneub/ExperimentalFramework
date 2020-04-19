import Foundation
import URLNavigator

// the point, as a step on from the previous, is that the knowledge
// of what wireframe to initialize now resides entirely in one place, here

enum URLNavigationMap {
  static func initialize(navigator: NavigatorType) {
    // _register_ URLs
    navigator.register("testing://root") {
        url, values, context in
        let wireframe = RootWireframe()
        return wireframe.viewController
    }
    navigator.register("testing://next") {
        url, values, context in
        let wireframe = NextWireframe()
        return wireframe.viewController
    }
    // _handle_ URLs
    // this is sort of silly example, but shows how we might dismiss _here_
    // rather than in wireframe
    navigator.handle("testing://backToRoot") {
        url, values, context in
        (context as? UIViewController)?.dismiss(animated: true)
        return true
    }
    
  }
}

