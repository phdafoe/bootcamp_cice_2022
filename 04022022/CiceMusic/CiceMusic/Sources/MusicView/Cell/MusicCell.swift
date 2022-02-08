//
//  MusicCell.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/2/22.
//

import UIKit

protocol MusicCellInputProtocol {
    func setupCell(data:ResultMusic)
}

class MusicCell: UITableViewCell, ReuseIdentifierProtocol {

    
    // MARK: - IBOutlets
    @IBOutlet weak var artistWorkimageView: UIImageView!
    @IBOutlet weak var artisnameLBL: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var kindLBLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MusicCell: MusicCellInputProtocol {
    func setupCell(data: ResultMusic) {
        //
    }
}
