//
//  HomeViewCellController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var animeGenreLabel: UILabel!
    @IBOutlet weak var animeYearLabel: UILabel!
    @IBOutlet weak var animeTitleLabel: UILabel!
    
    func setUp(model: TopAnimeDataVO) {
        let unwrap = model.image ?? ""
        let url = URL(string: unwrap)!
        
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                // Create Image and Update Image View
                animeImage.image = UIImage(data: data)
            }
        animeYearLabel.text = String(model.year ?? 0)
        animeGenreLabel.text = model.genre?.first?.name
        animeTitleLabel.text = model.titleEnglish
        
    }
}
