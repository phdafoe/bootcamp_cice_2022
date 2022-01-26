//
//  PerfilCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/1/22.
//

import UIKit

protocol PerfilCellOutputDelegate: class {
    func showAlertB1()
    func showAlertB2()
    func navigationToDetailView(withData: UserDataModel?)
}

protocol PerfilCellInputProtocol {
    func setupCellPerfil(data: UserDataModel?)
}

class PerfilCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: Variables globales
    weak var delegate: PerfilCellOutputDelegate?
    var modelData: UserDataModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var miImagenPerfil: UIImageView!
    @IBOutlet weak var miUsuarioLinkedInLBL: UILabel!
    @IBOutlet weak var miNombrePerfilLBL: UILabel!
    @IBOutlet weak var miDescripcionCVLBL: UILabel!
    @IBOutlet weak var miPuestoActualLBL: UILabel!
    
    // MARK: - IBActions
    @IBAction func senderEventAlertB1ACTION(_ sender: UIButton) {
        self.delegate?.showAlertB1()
    }
    
    
    @IBAction func senderEventAlertB2ACTION(_ sender: Any) {
        self.delegate?.showAlertB2()
    }
    
    
    @IBAction func senderEventButton3ACTION(_ sender: Any) {
        self.delegate?.navigationToDetailView(withData: self.modelData)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellInputProtocol {
    func setupCellPerfil(data: UserDataModel?) {
        self.modelData = data
        self.miImagenPerfil.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miUsuarioLinkedInLBL.text = data?.usuarioLinkedInPerfil
        self.miNombrePerfilLBL.text = data?.nombrePerfil
        self.miDescripcionCVLBL.text = data?.descripcionPerfil
        self.miPuestoActualLBL.text = data?.puestoActualperfil
    }
}
