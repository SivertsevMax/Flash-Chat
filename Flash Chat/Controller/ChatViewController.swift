import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messeges: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
        tableView.delegate = self
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    //MARK: - func of ChatViewController
    
    @IBAction func sendPressed(_ sender: UIButton) {
        sendButtonPressed()
    }
    
    func sendButtonPressed() {
        if let message = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            var ref: DocumentReference? = nil
            ref = db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: "\(messageSender)",
                K.FStore.bodyField: "\(message)",
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
        
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
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                
            self.messeges = []
                
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let snapShotDocument = querySnapshot?.documents {
                    for document in snapShotDocument {
                        let data =  document.data()
                        if let messageSender = data[K.FStore.senderField] as? String,
                           let messageBody = data[K.FStore.bodyField] as? String,
                           let _ = data[K.FStore.dateField]
                        {
                            let newMesseges = Message(sender: messageSender, body: messageBody)
                            self.messeges.append(newMesseges)
                            
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                
                                let indexPath = IndexPath(row: (snapShotDocument.count - 1), section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messeges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messeges[indexPath.row]
        

        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        let messageCell = cell  as! MessageCell
        messageCell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            messageCell.rightImageView.isHidden = false
            messageCell.leftImageView.isHidden = true
            messageCell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            messageCell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        } else {
            messageCell.rightImageView.isHidden = true
            messageCell.leftImageView.isHidden = false
            messageCell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            messageCell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        
        return messageCell
    }
}

//MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

