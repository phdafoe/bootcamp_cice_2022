//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 31/1/22.
//

import UIKit
import MessageUI

class DetalleContactoViewController: UIViewController {
    
    
    // MARK: - Variables globales
    var dataModel: Contact?
    
    // MARK: - IBOutlets
    @IBOutlet weak var detalleContactoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: "mail"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(configuracionMail))
        self.navigationItem.rightBarButtonItem = button1
    }

    private func configuracionTableView() {
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }
    
    @objc
    func configuracionMail() {
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.configuracionMailCompose(delegate: self,
                                                        data: dataModel),
                         animated: true,
                         completion: nil)
        } else {
            self.present(Utils.muestraAlerta(titulo: "Upss!",
                                             mensaje: "No puedes enviar mail, lo sentimos",
                                             completionHandler: { _ in
                                                self.present(Utils.muestraAlerta(titulo: "Sabemos que estás!!", mensaje: "En un Simulador hahaha", completionHandler: nil), animated: true, completion: nil)
                                             }),
                         animated: true,
                         completion: nil)
        }
    }
    
    private func muestraPhotoMenu(){
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.tomafoto()
        }))
        actionSheetVC.addAction(UIAlertAction(title: "Escoge de la libreria", style: .default, handler: { _ in
            self.muestraPhotoLibrary()
        }))
        self.present(actionSheetVC, animated: true, completion: nil)
    }

    private func muestraPhotoLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }

    private func tomafoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension DetalleContactoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleContactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        cell.delegate = self
        if let modelData = self.dataModel {
            cell.configuracionCell(data: modelData)
        }
        return cell
    }
}

extension DetalleContactoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetalleContactoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        DispatchQueue.main.async {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}

extension DetalleContactoViewController: PerfilCellDelegate {
    func showCameraPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
        } else {
            self.muestraPhotoLibrary()
        }
    }
}

extension DetalleContactoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            debugPrint(image)
            let imageData = image.jpegData(compressionQuality: 0.5)
            Utils.Constantes().kPrefs.setValue(imageData, forKey: Utils.Constantes().kImageProfile)
            self.detalleContactoTableView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}



