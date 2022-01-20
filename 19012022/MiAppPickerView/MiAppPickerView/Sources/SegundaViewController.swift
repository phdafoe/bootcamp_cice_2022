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
    let dataSourcePrioridadTeletrabajo = ["Altisima", "Media", "Baja", "Muy baja"]
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
        self.perfilImageView.image = UIImage(named: self.dataSourceFotosPerfil.first ?? "placeholder")
        Utils.shared.configuracionPickerView(tag: 1,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.localidadesTF,
                                             dataArray: self.dataSourceLocalidades)
        
        Utils.shared.configuracionPickerView(tag: 2,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.codigoPostalTF,
                                             dataArray: self.dataSourceCodigosPostales)
        
        Utils.shared.configuracionPickerView(tag: 3,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.prioridadTrabajoTF,
                                             dataArray: self.dataSourcePrioridadTeletrabajo)
    }
    

}

extension SegundaViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.dataSourceLocalidades[row]
        case 2:
            return self.dataSourceCodigosPostales[row]
        default:
            return self.dataSourcePrioridadTeletrabajo[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.localidadesTF.text = self.dataSourceLocalidades[row]
        case 2:
            self.codigoPostalTF.text = self.dataSourceCodigosPostales[row]
        default:
            self.prioridadTrabajoTF.text = self.dataSourcePrioridadTeletrabajo[row]
            self.perfilImageView.image = UIImage(named: self.dataSourceFotosPerfil[row])
        }
    }
    
}

extension SegundaViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.dataSourceLocalidades.count
        case 2:
            return self.dataSourceCodigosPostales.count
        default:
            return self.dataSourcePrioridadTeletrabajo.count
        }
    }
}
