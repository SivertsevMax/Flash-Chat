import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: false)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            let alert = UIAlertController(title: "Alert", message: signOutError.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default))
            self.present(alert, animated: false)
        }
        
    }
    
}
