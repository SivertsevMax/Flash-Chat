import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var mainTitle: CLTypingLabel!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 5
        logInButton.layer.cornerRadius = registerButton.frame.size.height / 5
        mainTitle.text = K.appName
        
    }
    
}

