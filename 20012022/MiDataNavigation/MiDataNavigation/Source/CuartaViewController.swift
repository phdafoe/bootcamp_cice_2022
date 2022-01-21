//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by Andres Felipe Ocampo Eljaiek on 20/1/22.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var codigoPOstalLBL: UILabel!
    @IBOutlet weak var ciudadLBL: UILabel!
    @IBOutlet weak var posicionGeoLBL: UILabel!
    
    
    @IBAction func enviarTodaLaInformacionMailACTION(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.shared.configuracionMailCompose(delegate: self,
                                                               data: [self.miNombreLBL.text ?? ""]),
                         animated: true,
                         completion: nil)
        } else {
            self.present(Utils.shared.showAlertVC(title: "Que pasa!!",
                                                  message: "Estas en un Simulador y no puedes enviar email"),
                         animated: true,
                         completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    
    private func configuracionUI() {
        self.miNombreLBL.text = datosUsuario.nombreData
        self.miApellidoLBL.text = datosUsuario.apellidoData
        self.miTelefonoLBL.text = datosUsuario.telefonoData
        self.miDireccionLBL.text = datosUsuario.direccionData
        self.edadPerroLBL.text = datosUsuario.edadPerroData
        self.codigoPOstalLBL.text = datosUsuario.codigoPostalData
        self.ciudadLBL.text = datosUsuario.ciudadData
        self.posicionGeoLBL.text = datosUsuario.posicionGeograficaData
    }


}

extension CuartaViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
}
