import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class LoginViewController: UIViewController {
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = loginEmail.text, let password = loginPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: "ChatVC", sender: self)
                }
            }
        }
    }
    
}
