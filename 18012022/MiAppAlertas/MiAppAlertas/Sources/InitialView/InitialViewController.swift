//
//  InitialViewController.swift
//  MiAppAlertas
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/1/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    // MARK: - IBActions
    
    @IBAction func showAlertViewController(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let alertVC = UIAlertController(title: "Esta es una Alerta simple",
                                            message: "Vamos a probar muchas cosas",
                                            preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                let storyboardNavigationViewController = self.storyboard?.instantiateViewController(identifier: "NavigationViewController")
                if let vc = storyboardNavigationViewController {
                    self.show(vc, sender: nil)
                }
            }
            alertVC.addAction(okAction)
            
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                print(#function)
            }))
            self.present(alertVC, animated: true, completion: nil)
        default:
            let actionSheetVC = UIAlertController(title: "Esta es una Hoja de Acciones",
                                                  message: "Vamos a seguir prpbando todos",
                                                  preferredStyle: .actionSheet)
            actionSheetVC.addAction(UIAlertAction(title: "Default", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            actionSheetVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                let storyboardNavigationViewController = self.storyboard?.instantiateViewController(identifier: "NavigationViewController")
                if let vc = storyboardNavigationViewController {
                    self.show(vc, sender: nil)
                }
            }))
            actionSheetVC.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                let storyboardPresenterViewController = self.storyboard?.instantiateViewController(identifier: "PresenterViewController")
                if let vc = storyboardPresenterViewController {
                    self.present(vc, animated: true) {
                        // TODO: - Aqui meteremos otro metodo
                    }
                }
            }))
            self.present(actionSheetVC, animated: true) {
                // TODO: - Aqui meteremos otro metodo
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func choosePhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }

}

extension InitialViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {}
