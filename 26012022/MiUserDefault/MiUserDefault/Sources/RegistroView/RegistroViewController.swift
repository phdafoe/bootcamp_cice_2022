//
//  RegistroViewController.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/1/22.
//

import UIKit

class RegistroViewController: UIViewController {
    
    // MARK: - Variables globales
    var existeFoto = false
    var usuarioLogado = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func guardarDatosACTION(_ sender: Any) {
        
    }
    
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
