//
//  RegisterViewController.swift
//  JournalApp
//
//  Created by Karl McPhee on 3/12/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    let registerLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Hello"
        loginLabel.textColor = .green
        return loginLabel
    }()
    
    let emailData: UITextField = {
        let emailData = UITextField(frame: CGRect(x: 10, y: 20, width: 20, height: 20))
        emailData.backgroundColor = .white
        emailData.placeholder = "Enter an email"
        
        return emailData
    }()
    
    let passwordData: UITextField = {
        let passwordData = UITextField()
        passwordData.backgroundColor = .white
        return passwordData
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10

        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(onSwitch))
        registerButton.addTarget(self, action: #selector(didRegister), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func didRegister() {
        if emailData.text != "" && passwordData.text != "" {
            Auth.auth().createUser(withEmail: emailData.text!, password: passwordData.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
    }
    
    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)

        // You can add actions using the following code
        alert.addAction(UIAlertAction(title: NSLocalizedString("Close Alert", comment: "This closes alert"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))

        // This part of code inits alert view
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func onSwitch() {
        let vc = LoginViewController()
        vc.title = "Login"
        navigationController?.pushViewController(vc, animated: true)
    

            }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
