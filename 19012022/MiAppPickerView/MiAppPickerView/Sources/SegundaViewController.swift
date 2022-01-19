//
//  SegundaViewController.swift
//  MiAppPickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/1/22.
//

import UIKit

class SegundaViewController: UIViewController {
    
    // MARK: - Variables
    let dataSourceLocalidades = ["Calamanca", "La Fatina", "Muencarral", "Gentas"]
    let dataSourceCodigosPostales = ["21001", "22002", "23003", "24004"]
    let dataSourcePrioridadTeletrabajo = ["Altisima", "Media", "Baja"]
    let dataSourceFotosPerfil = ["maria", "felipe", "maria", "felipe"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var localidadesTF: UITextField!
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var prioridadTrabajoTF: UITextField!
    @IBOutlet weak var perfilImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    private func configuracionUI() {
        
    }
    

}
