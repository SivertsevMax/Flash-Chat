import UIKit

class RegistrationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ChatVC", sender: self)
    }
}
