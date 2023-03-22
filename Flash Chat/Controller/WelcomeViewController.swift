//
//  ViewController.swift
//  Flash Chat
//
//  Created by Максим Сиверцев on 22.03.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterButton.layer.cornerRadius = 15
        LogInButton.layer.cornerRadius = 15
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginVC", sender: self)
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegistrationVC", sender: self)
    }
    
}

