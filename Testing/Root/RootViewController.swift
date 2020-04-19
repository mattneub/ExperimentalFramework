import UIKit

final class RootViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: RootPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        // non-template code just so we see something
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "Hello, world"
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(label)
    }

}

// MARK: - Extensions -

extension RootViewController: RootViewInterface {
}
