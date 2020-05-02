import UIKit

final class RootViewController: BaseViewController<RootPresenter> {

    // MARK: - Public properties -
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Root"
        let bbi = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(doPush))
        self.navigationItem.rightBarButtonItem = bbi
    }
    
    override func setupViews() {
        // non-template code just so we see something
        // in real life, use autolayout (perhaps snapkit)
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "Hello, world"
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 50, y: 100)
        self.view.addSubview(label)
        // introduce interface for navigating
        let b = UIButton(type: .system)
        b.setTitle("Present", for: .normal)
        b.sizeToFit()
        b.frame.origin = CGPoint(x: 50, y: 150)
        self.view.addSubview(b)
        b.addTarget(self, action: #selector(doPresent), for: .primaryActionTriggered)
    }

    @objc func doPresent(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToPresent()
    }
    
    @objc func doPush(_ sender: Any) {
        self.presenter.userWantsToPush()
    }
}

// MARK: - Extensions -

extension RootViewController: RootViewInterface {
}
