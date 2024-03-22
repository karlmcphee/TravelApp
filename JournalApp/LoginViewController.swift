//
//  LoginViewController.swift
//  JournalApp
//
//  Created by Karl McPhee on 3/10/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Enter your credentials to login"
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.textColor = .black
        loginLabel.textAlignment = .center
        return loginLabel
    }()
    
    let emailData: UITextField = {
        let emailData = UITextField(frame: CGRect(x: 10, y: 20, width: 20, height: 20))
        emailData.translatesAutoresizingMaskIntoConstraints = false
        emailData.backgroundColor = .white
        emailData.layer.cornerRadius = 12
        emailData.layer.borderWidth = 1
        emailData.placeholder = "Enter an email"
        
        return emailData
    }()
    
    let passwordData: UITextField = {
        let passwordData = UITextField()
        passwordData.translatesAutoresizingMaskIntoConstraints = false
        passwordData.backgroundColor = .white
        passwordData.placeholder = "Enter a password"
        return passwordData
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(loginLabel)
        view.addSubview(emailData)
        view.addSubview(passwordData)
        view.addSubview(loginButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(onRegister))
        
        loginButton.addTarget(self, action: #selector(onLogin),
                              for: .touchUpInside)
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.widthAnchor.constraint(equalToConstant: 300),
            loginLabel.heightAnchor.constraint(equalToConstant: 300),
            emailData.topAnchor.constraint(equalTo: loginLabel.bottomAnchor),
            emailData.widthAnchor.constraint(equalToConstant: 250),
            emailData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailData.heightAnchor.constraint(equalToConstant: 50),
            passwordData.topAnchor.constraint(equalTo: emailData.bottomAnchor),
            passwordData.widthAnchor.constraint(equalToConstant: 250),
            passwordData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordData.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: passwordData.bottomAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 80),
            ])
        // Do any additional setup after loading the view.
    }
    
    @objc func onLogin() {
        if passwordData.text == "" || emailData.text == "" {
            loginLabel.text = "Please enter a username and password"
        } else {
            
                Auth.auth().signIn(withEmail: emailData.text!, password: passwordData.text!) { (authdata, error) in
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
    
    @objc func onRegister() {
        let vc = RegisterViewController()
        vc.title = "Register"
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
