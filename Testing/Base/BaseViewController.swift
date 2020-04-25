import UIKit

// parent for all your view controllers, incorporate common setup etc.
class BaseViewController<PresenterType: PresenterInterface>: UIViewController {
    
    var presenter: PresenterType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
        self.setupConstraints()
        self.setupViews()
        self.setupAccessibilities()
        self.setupColors()
    }
    
    func addSubviews() {}
    func setupConstraints() {}
    func setupViews() {}
    func setupAccessibilities() {}
    func setupColors() {}

}
