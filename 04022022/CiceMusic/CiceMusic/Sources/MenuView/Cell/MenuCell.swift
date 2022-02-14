//
//  MenuCell.swift
//  CiceMusic
//
//  Created by TECDATA ENGINEERING on 14/2/22.
//

import UIKit

protocol MenuCellProtocol {
    func setupCell(data: MenuResponse)
}

class MenuCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOulets
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameMenuLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func showImageWithName(data: Menu) -> UIImage {
        switch data.imagen {
        case "iconoAvatar":
            return #imageLiteral(resourceName: "iconoAvatar")
        case "musicAvatar":
            return #imageLiteral(resourceName: "musicAvatar")
        case "calendarioAvatar":
            return #imageLiteral(resourceName: "calendarioAvatar")
        case "consejosAvatar":
            return #imageLiteral(resourceName: "consejosAvatar")
        default:
            return #imageLiteral(resourceName: "nosotrosAvatar")
        }
    }
    
}

extension MenuCell: MenuCellProtocol {
    func setupCell(data: MenuResponse){
        if let dataUnw = data.menu {
            self.nameMenuLBL.text = dataUnw.literal
            self.iconImageView.image = self.showImageWithName(data: dataUnw)
        }
        
    }
}
