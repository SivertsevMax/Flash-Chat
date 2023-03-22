import UIKit

class RegistrationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backToMainView(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ChatVC", sender: self)
    }
}
