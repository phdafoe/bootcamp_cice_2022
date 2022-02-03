//
//  NuevaTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

class NuevaTareaViewController: UIViewController {
    
    // MARK: - Variables globales
    let dataSourcePrioridad = ["ALTA", "MEDIA-ALTA", "MEDIA", "MEDIA-BAJA", "BAJA"]
    var nombreCategoria = "Sin Categoría"
    var fotoSeleccionada = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTV: UITextView!
    @IBOutlet weak var imagenTareaIV: UIImageView!
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var salvarDatosBTN: UIButton!
    
    // MARK: - IBActions
    @IBAction func muestraLIstaCategorias(_ sender: Any) {
        let vc = CategoriaViewCoordinator.view(delegate: self)
        self.show(vc, sender: nil)
    }
    
    @IBAction func salvarTareaUDACTION(_ sender: Any) {
        if validacionDatos() {
            
            if let imageData = self.imagenTareaIV.image?.jpegData(compressionQuality: 0.3) {
                
                SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
                                                                                  pNewTask: self.nuevaTareaTF.text ?? "",
                                                                                  pPriority: self.prioridadTF.text ?? "",
                                                                                  pTaskDate: self.fechaTF.text ?? "",
                                                                                  pTaskDescription: self.descripcionTV.text ?? "",
                                                                                  pTaskCategory: self.categoriaLBL.text ?? "",
                                                                                  pTaskImage: imageData)) { result in
                    if result != nil{
                        self.present(Utils.muestraAlerta(titulo: "Genial!!",
                                                         mensaje: "Los datos se han salvado correctamente en Userdefault",
                                                         completionHandler: { _ in
                                                            // notification push local (deprecated)
                                                            let notification = UILocalNotification()
                                                            notification.fireDate = Date(timeIntervalSinceNow: 5)
                                                            notification.alertBody = self.nuevaTareaTF.text
                                                            notification.timeZone = NSTimeZone.default
                                                            notification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
                                                            UIApplication.shared.scheduleLocalNotification(notification)
                                                            
                                                            self.limpiarDatos()
                                                         }),
                                     animated: true,
                                     completion: nil)
                    }
                } failure: { error in
                    debugPrint(error ?? "")
                }
            }
        } else {
            self.present(Utils.muestraAlerta(titulo: "Hey!!",
                                             mensaje: "Por favor rellena todos los casmpos y ten en cuenta seleccionar una fotografia de la tarea",
                                             completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    @IBAction func muestraCamaraFotosACTION(_ sender: Any) {
        self.muestraSelectorFoto()
    }
    
    
    @IBAction func muestraDatePickerACTION(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickervalueChanged(_:)), for: .valueChanged)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    private func limpiarDatos() {
        self.nuevaTareaTF.text = ""
        self.prioridadTF.text = ""
        self.fechaTF.text = ""
        self.descripcionTV.text = "Coloca una breve descripción de tu tarea"
        self.imagenTareaIV.image = UIImage(named: "placeholder")
        self.categoriaLBL.text = self.nombreCategoria
    }
    
    @objc
    func datePickervalueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        self.fechaTF.text = dateFormatter.string(from: sender.date)
    }
    
    private func validacionDatos() -> Bool {
        return !(self.nuevaTareaTF.text?.isEmpty ?? false) &&
            !(self.prioridadTF.text?.isEmpty ?? false) &&
            !(self.fechaTF.text?.isEmpty ?? false) &&
            !(self.descripcionTV.text?.isEmpty ?? false) &&
            !(self.categoriaLBL.text?.isEmpty ?? false) &&
            fotoSeleccionada
    }
    
    private func muestraSelectorFoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.present(Utils.muestraPhotoMenu(completionFoto: { _ in
                self.present(Utils.tomafoto(delegate: self), animated: true, completion: nil)
            }, completionLibrary: { _ in
                self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
            }), animated: true, completion: nil)
        } else {
            self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
        }
    }
    
    private func configuracionUI() {
        self.title = "Nueva Tarea"
        self.categoriaBTN.layer.cornerRadius = 16
        self.salvarDatosBTN.layer.cornerRadius = 16
        self.imagenTareaIV.layer.cornerRadius = self.imagenTareaIV.frame.width / 2
        self.imagenTareaIV.layer.borderWidth = 1.2
        self.imagenTareaIV.layer.borderColor = UIColor.red.cgColor
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.dataSourcePrioridad.first
        
        self.categoriaLBL.text = self.nombreCategoria
        self.nuevaTareaTF.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageUnw = info[.originalImage] as? UIImage {
            self.imagenTareaIV.image = imageUnw
            self.fotoSeleccionada = true
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSourcePrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSourcePrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.prioridadTF.text = self.dataSourcePrioridad[row]
    }
}

extension NuevaTareaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension NuevaTareaViewController: CategoriaViewControllerDelegate {
    func nombreCategoriaSeleccionada(categoria: String) {
        self.categoriaLBL.text = categoria
    }
}
