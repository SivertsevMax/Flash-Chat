import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 15
        logInButton.layer.cornerRadius = 15
        mainTitle.text = ""
        
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        for char in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.mainTitle.text?.append(char)
            }
            charIndex += 1
        }
        
    }
    
}

