//
//  RegisterViewController.swift
//  JournalApp
//
//  Created by Karl McPhee on 3/12/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UINavigationControllerDelegate {
    
    let registerLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Sign up here"
        loginLabel.textColor = .green
        loginLabel.textAlignment = .center
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    
    let emailData: UITextField = {
        let emailData = UITextField()
        emailData.backgroundColor = .white
        emailData.layer.cornerRadius = 12
        emailData.layer.borderWidth = 1
        emailData.translatesAutoresizingMaskIntoConstraints = false
        emailData.placeholder = "Enter an email"
        
        return emailData
    }()
    
    let passwordData: UITextField = {
        let passwordData = UITextField()
        passwordData.backgroundColor = .white
        passwordData.layer.cornerRadius = 12
        passwordData.layer.borderWidth = 1
        passwordData.translatesAutoresizingMaskIntoConstraints = false
        passwordData.placeholder = "Enter an password"
        return passwordData
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(registerLabel)
        view.addSubview(emailData)
        view.addSubview(passwordData)
        view.addSubview(registerButton)

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(onSwitch))
        registerButton.addTarget(self, action: #selector(didRegister), for: .touchUpInside)
        NSLayoutConstraint.activate([
        registerLabel.topAnchor.constraint(equalTo: view.topAnchor),
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        registerLabel.widthAnchor.constraint(equalToConstant: 300),
        registerLabel.heightAnchor.constraint(equalToConstant: 300),
        emailData.topAnchor.constraint(equalTo: registerLabel.bottomAnchor),
        emailData.widthAnchor.constraint(equalToConstant: 250),
        emailData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        emailData.heightAnchor.constraint(equalToConstant: 80),
        passwordData.topAnchor.constraint(equalTo: emailData.bottomAnchor),
        passwordData.widthAnchor.constraint(equalToConstant: 250),
        passwordData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        passwordData.heightAnchor.constraint(equalToConstant: 80),
        registerButton.topAnchor.constraint(equalTo: passwordData.bottomAnchor),
        registerButton.widthAnchor.constraint(equalToConstant: 250),
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        registerButton.heightAnchor.constraint(equalToConstant: 80),
        ])

        // Do any additional setup after loading the view.
    }
    
    @objc func didRegister() {
        if emailData.text != "" && passwordData.text != "" {
            Auth.auth().createUser(withEmail: emailData.text!, password: passwordData.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    let vc = ViewController()
                    vc.title = "Journal"
                    self.navigationController?.pushViewController(vc, animated: true)
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
