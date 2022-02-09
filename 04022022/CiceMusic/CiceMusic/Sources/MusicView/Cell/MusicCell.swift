//
//  MusicCell.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/2/22.
//

import UIKit
import Kingfisher

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
        
        let url = URL(string: data.artworkUrl100 ?? "")
        let processor = DownsamplingImageProcessor(size: artistWorkimageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        artistWorkimageView.kf.indicatorType = .activity
        artistWorkimageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        self.artisnameLBL.text = data.artistName
        self.releaseDateLBL.text = data.releaseDate
        self.kindLBLB.text = data.kind
    }
}
