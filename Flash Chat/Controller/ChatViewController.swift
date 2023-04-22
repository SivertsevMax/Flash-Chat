import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messeges: [Message] = [
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?"),
        Message(sender: "1", body: "hello"),
        Message(sender: "2", body: "hey!"),
        Message(sender: "1", body: "what's up?")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.cellIdentifier)
        tableView.dataSource = self
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: false)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            let alert = UIAlertController(title: "ERROR", message: signOutError.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "close", style: UIAlertAction.Style.default))
            self.present(alert, animated: false)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messeges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel!.text = self.messeges[indexPath.row].body
        return cell
    }
}
