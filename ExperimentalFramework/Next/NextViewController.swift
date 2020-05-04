import UIKit

final class NextViewController: BaseViewController<NextPresenter> {
    
    private let label = UILabel()
    private let textField = UITextField()
    private let button = UIButton(type: .system)

    // MARK: - Public properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", self) // prove we are not leaking
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func addSubviews() {
        self.view.addSubview(label)
        self.view.addSubview(textField)
        self.view.addSubview(button)
    }
    
    override func setupConstraints() {
        label.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(100)
            maker.leading.equalToSuperview().offset(50)
        }
        textField.snp.makeConstraints { maker in
            maker.leading.equalTo(label)
            maker.width.equalTo(150)
            maker.top.equalTo(label.snp.bottom).offset(20)
        }
        button.snp.makeConstraints { maker in
            maker.leading.equalTo(label)
            maker.top.equalTo(textField.snp.bottom).offset(50)
        }
    }
    
    override func setupViews() {
        label.text = "What is your name?"
        textField.borderStyle = .roundedRect
        textField.addTarget(nil, action: #selector(dummy), for: .editingDidEndOnExit)
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(doButton), for: .primaryActionTriggered)
    }
    
    override func setupColors() {
        self.view.backgroundColor = .white
    }
    
    @objc func doButton(_ sender: Any) {
        // we are not allowed to do anything ourselves; talk to the presenter
        self.presenter.userWantsToNavigateBack()
    }
    
    @objc func dummy(_ sender: Any) {}
}

// MARK: - Extensions -

extension NextViewController: NextViewInterface {
}
