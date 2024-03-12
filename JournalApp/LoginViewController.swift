//
//  LoginViewController.swift
//  JournalApp
//
//  Created by Karl McPhee on 3/10/24.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        return loginLabel
    }()
    
    let userName: UITextField = {
        let userName = UITextField(frame: CGRect(x: 10, y: 20, width: 20, height: 20))
        userName.backgroundColor = .white
        userName.placeholder = "Enter an email"
        
        return userName
    }()
    
    let password: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white
        return password
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginLabel)
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(loginButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(onRegister))
        
        loginButton.addTarget(self, action: #selector(onLogin),
                              for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func onLogin() {
        if password.text == "" || userName.text == "" {
            loginLabel.text = "Please enter a username and password"
        } else {
            /*
                Auth.auth().signIn(withEmail: emailLabel.text!, password: passwordLabel.text!) { (authdata, error) in
                    if error != nil {
                        self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    } else {
                        self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
                }
             */
        }
        
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
