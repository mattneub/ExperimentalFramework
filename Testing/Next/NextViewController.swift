import UIKit

final class NextViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: NextPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

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

    }
    
    @objc func doButton(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToNavigateBack()
    }

}

// MARK: - Extensions -

extension NextViewController: NextViewInterface {
    func dismissYourself() {
        delay(0.2) { // otherwise we don't get nice animation
            self.dismiss(animated: true)
        }
    }
    
}
