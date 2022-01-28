//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlest
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewusername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func remeberMeACTION(_ sender: Any) {
        
    }
    
    @IBAction func loginACTION(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }

    private func configuracionUI() {
        self.contentViewusername.backgroundColor = .clear
        self.contentViewusername.layer.cornerRadius = 37
        self.contentViewusername.layer.borderWidth = 2
        self.contentViewusername.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.loginBTN.layer.cornerRadius = 23
    }

}
