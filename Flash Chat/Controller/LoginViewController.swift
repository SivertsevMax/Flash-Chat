import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginVC", sender: self)
    }
    @IBAction func backToMainButtonPressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
