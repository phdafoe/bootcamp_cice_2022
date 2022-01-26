//
//  PostCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/1/22.
//

import UIKit

protocol PostCellProtocol {
    func setupPostCell(data: UserDataModel?)
}


class PostCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var miImagenPerfilPost: UIImageView!
    @IBOutlet weak var miNombrePerfilPost: UILabel!
    @IBOutlet weak var miPuestoTrabajoPost: UILabel!
    @IBOutlet weak var miFechaActualPost: UILabel!
    @IBOutlet weak var miDescripcionPost: UILabel!
    @IBOutlet weak var miTituloPostLBL: UILabel!
    @IBOutlet weak var miNumeroLikesLBL: UILabel!
    @IBOutlet weak var miNumeroComentariosLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func configuracionUI() {
        self.miImagenPerfilPost.layer.cornerRadius = self.miImagenPerfilPost.frame.width / 2
    }
    
}


extension PostCell: PostCellProtocol {
    
    func setupPostCell(data: UserDataModel?) {
        self.miImagenPerfilPost.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miNombrePerfilPost.text = data?.nombrePerfil
        self.miPuestoTrabajoPost.text = data?.puestoActualperfil
        self.miFechaActualPost.text = "\(Date())"
        self.miDescripcionPost.text = data?.descripcionPerfil
        self.miTituloPostLBL.text = "Estamos lanzando la App"
        self.miNumeroLikesLBL.text = "Likes: 1K"
        self.miNumeroComentariosLBL.text = "Comentarios: 2K"
    }
}
