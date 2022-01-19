//
//  ViewController.swift
//  MiAppPickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables globales
    let quesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var titullllloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    @IBOutlet weak var imagenQuesoImV: UIImageView!
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
    }
    
    // MARK: - Metodos privados
    private func configuracionUI() {
        self.title = "Quesos del Mundo"
        self.titullllloQuesoLBL.text = self.quesosArrayData.first
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
        
        self.detalleTextQuesoTXV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
    }
    
    private func configuracionPickerView() {
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
    }
}

// MARK: - extension -> UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.titullllloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleTextQuesoTXV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        case 1:
            self.detalleTextQuesoTXV.text = "La Gorgonzola (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella."
        case 2:
            self.detalleTextQuesoTXV.text = "La Provolone (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        case 3:
            self.detalleTextQuesoTXV.text = "La Stilton (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        default:
            self.detalleTextQuesoTXV.text = "La Asiago El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        }
    }
    
}

// MARK: - extension -> UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }
}

