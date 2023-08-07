//
//  HomeViewCellController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var animeImage: UIImageView!
    @IBOutlet private weak var animeGenreLabel: UILabel!
    @IBOutlet private weak var animeYearLabel: UILabel!
    @IBOutlet private weak var animeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: Configuration
        configureImage()
        configureTitle()
        configureGenre()
        configureYear()
    }
    
    private func configureImage() {
        animeImage.contentMode = .scaleToFill
        animeImage.layer.cornerRadius = 10
    }
    
    private func configureTitle()  {
        animeTitleLabel.font = .systemFont(ofSize: 12)
        animeTitleLabel.numberOfLines = 2
        animeTitleLabel.sizeToFit()
    }
    private func configureGenre()  {
        animeGenreLabel.font = .systemFont(ofSize: 12)
    }
    private func configureYear()  {
        animeYearLabel.font = .systemFont(ofSize: 12)
        animeYearLabel.textAlignment = .right
    }
    
    func setUp(model: TopAnimeDataVO) {
        DispatchQueue.main.async { [weak self] in
            let unwrap = model.image ?? ""
            let url = URL(string: unwrap)!
            if let data = try? Data(contentsOf: url) {
                self?.animeImage.image = UIImage(data: data)
            }
        }
        animeYearLabel.text = String(model.year ?? 0)
        animeGenreLabel.text = model.genre?.first?.name
        animeTitleLabel.text = model.titleEnglish
        
    }
}
