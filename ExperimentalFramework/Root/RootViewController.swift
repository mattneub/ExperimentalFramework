import UIKit
import SnapKit

final class RootViewController: BaseViewController<RootPresenter> {
    
    private let label = UILabel()
    private let button = UIButton(type: .system)

    // MARK: - Public properties -
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Root"
        let bbi = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(doPush))
        self.navigationItem.rightBarButtonItem = bbi
    }
    
    override func addSubviews() {
        self.view.addSubview(label)
        self.view.addSubview(button)
    }
    
    override func setupConstraints() {
        label.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(100)
            maker.leading.equalToSuperview().offset(50)
        }
        button.snp.makeConstraints { maker in
            maker.leading.equalTo(label)
            maker.top.equalTo(label.snp.bottom).offset(50)
        }
    }
    
    override func setupViews() {
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(doPresent), for: .primaryActionTriggered)
        self.updateLabel()
    }
    
    override func setupColors() {
        self.view.backgroundColor = .white
    }

    // we are not allowed to do anything ourselves; talk to the presenter
    @objc func doPresent(_ sender: Any) {
        self.presenter.userWantsToPresent()
    }
    
    @objc func doPush(_ sender: Any) {
        self.presenter.userWantsToPush()
    }
    
    private func updateLabel() {
        self.label.text = "Hello, " + self.presenter.username + "!"
    }
}

// MARK: - Extensions -

extension RootViewController: RootViewInterface {
    func newUsername(_ s: String) {
        self.updateLabel()
    }
}
