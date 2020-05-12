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

    deinit {
        print("farewell", self)
    }
}

// problem: all these UIViewControllers are being passed around...
// ...without a clue that they are in fact BaseViewControllers...
// ...and so it is hard to access their presenters
// solution: generic utility function that force-casts to BaseViewController
// caller simply has to state the expected presenter type
extension UIViewController {
    func presenter<T>() -> T where T: PresenterInterface {
        (self as! BaseViewController<T>).presenter
    }
}

