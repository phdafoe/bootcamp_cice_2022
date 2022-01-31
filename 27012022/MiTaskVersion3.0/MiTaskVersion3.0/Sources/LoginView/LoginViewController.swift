//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables globales
    var usuarioLogado = false
    
    // MARK: - IBOutlest
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewusername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func remeberMeACTION(_ sender: Any) {
        if datosCompletados() {
            self.usuarioLogado = true
            Utils.Constantes().kPrefs.setValue(self.usernameTF.text, forKey: Utils.Constantes().kUsername)
            Utils.Constantes().kPrefs.setValue(self.passwordTF.text, forKey: Utils.Constantes().kPassword)
            Utils.Constantes().kPrefs.setValue(self.usuarioLogado, forKey: Utils.Constantes().kUsuarioLogado)
            self.configuracionUI(color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
        } else {
            self.present(Utils.muestraAlerta(titulo: "hey!",
                                             mensaje: "Rellena el username y el password",
                                             completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados() {
            self.borrarDatosFormulario()
        } else {
            self.present(Utils.muestraAlerta(titulo: "hey!",
                                             mensaje: "Rellena el username y el password",
                                             completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color: #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1))
        // Do any additional setup after loading the view.
    }

    private func configuracionUI(color: UIColor) {
        self.contentViewusername.backgroundColor = .clear
        self.contentViewusername.layer.cornerRadius = 37
        self.contentViewusername.layer.borderWidth = 2
        self.contentViewusername.layer.borderColor = color.cgColor
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor
        
        self.loginBTN.layer.cornerRadius = 23
    }
    
    private func datosCompletados() -> Bool {
        return !(self.usernameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosFormulario() {
        self.usernameTF.text = ""
        self.passwordTF.text = ""
        self.mostrarHomeTabBar()
    }
    
    private func mostrarHomeTabBar() {
        let vc = HomeTabBarViewCoordinator.homeViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
