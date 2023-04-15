import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var mainTitle: CLTypingLabel!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 15
        logInButton.layer.cornerRadius = 15
        mainTitle.text = "⚡️FlashChat"
        
    }
    
}

