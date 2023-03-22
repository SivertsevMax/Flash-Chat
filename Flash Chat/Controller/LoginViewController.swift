import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ChatVC", sender: self)
    }
    
}
