import UIKit

final class NextViewController: BaseViewController<NextPresenter> {

    // MARK: - Public properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", self) // prove we are not leaking
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // observe how current route tells us what's happening
        print(URLNavigationMap.currentRoute as Any)
    }
    
    override func setupViews() {
        // in real life we'd use autolayout, perhaps with snapkit
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "You did it!"
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 50, y: 100)
        self.view.addSubview(label)

        let b = UIButton(type: .system)
        b.setTitle("Go Back", for: .normal)
        b.sizeToFit()
        b.frame.origin = CGPoint(x: 50, y: 150)
        self.view.addSubview(b)
        b.addTarget(self, action: #selector(doButton), for: .primaryActionTriggered)
        
        print(URLNavigationMap.currentRoute as Any)
    }
    
    @objc func doButton(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToNavigateBack()
    }
    
}

// MARK: - Extensions -

extension NextViewController: NextViewInterface {
}
