//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 31/1/22.
//

import UIKit

protocol PerfilCellDelegate: AnyObject {
    func showCameraPhoto()
}

protocol PerfilCellProtocol {
    func configuracionCell(data: Contact)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - Variables globales
    weak var delegate: PerfilCellDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitter: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var cvPerfil: UILabel!
    
    // MARK: - IBActions
    @IBAction func showCameraPhotos(_ sender: Any) {
        self.delegate?.showCameraPhoto()
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

extension PerfilCell: PerfilCellProtocol {
    func configuracionCell(data: Contact) {
        
        if let imageData = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kImageProfile) as? Data {
            self.photoProfile.image = UIImage(data: imageData)
        } else {
            self.photoProfile.image = UIImage(named: data.imageProfile ?? "placeholder")
        }
       
        self.usuarioTwitter.text = data.usernameTwitter
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
        self.cvPerfil.text = data.descriptionCV
    }
}
