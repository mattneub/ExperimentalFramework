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
        // introduce interface for navigating
        let b = UIButton(type: .system)
        b.setTitle("Navigate", for: .normal)
        b.sizeToFit()
        b.frame.origin = CGPoint(x: 50, y: 100)
        self.view.addSubview(b)
        b.addTarget(self, action: #selector(doButton), for: .primaryActionTriggered)
    }

    @objc func doButton(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToNavigate()
    }
}

// MARK: - Extensions -

extension RootViewController: RootViewInterface {
}
