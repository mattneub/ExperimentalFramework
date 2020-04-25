import UIKit

final class NextViewController: BaseViewController<NextPresenter> {

    // MARK: - Public properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(URLNavigationMap.currentRoute as Any)
    }
    
    override func setupViews() {
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "You did it!"
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 50, y: 50)
        self.view.addSubview(label)

        let b = UIButton(type: .system)
        b.setTitle("Go Back", for: .normal)
        b.sizeToFit()
        b.frame.origin = CGPoint(x: 50, y: 100)
        self.view.addSubview(b)
        b.addTarget(self, action: #selector(doButton), for: .primaryActionTriggered)
        
        print(URLNavigationMap.currentRoute as Any)
    }
    
    @objc func doButton(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToNavigateBack()
    }
    
    deinit {
        print("farewell", self)
    }

}

// MARK: - Extensions -

extension NextViewController: NextViewInterface {
}
