import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class RegistrationViewController: UIViewController {
    @IBOutlet weak var registrationEmail: UITextField!
    @IBOutlet weak var registrationPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.appName
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        if let email = registrationEmail.text, let password = registrationPassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "close", style: UIAlertAction.Style.default))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}
