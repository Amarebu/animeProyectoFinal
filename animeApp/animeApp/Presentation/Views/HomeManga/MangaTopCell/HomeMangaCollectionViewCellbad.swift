//
//  HomeMangaCollectionViewCell.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import UIKit

final class HomeMangaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mangaImage: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: Configuration
        configureImage()
        configureTitle()
        configureGenre()
        configureYear()
    }
    
    private func configureImage() {
        mangaImage.contentMode = .scaleToFill
        mangaImage.layer.cornerRadius = 10
    }
    
    private func configureTitle()  {
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    private func configureGenre()  {
        genreLabel.font = .systemFont(ofSize: 12)
    }
    private func configureYear()  {
        yearLabel.font = .systemFont(ofSize: 12)
        yearLabel.textAlignment = .right
    }
    
    func setUpManga(model: TopMangaDataVO) {
        DispatchQueue.main.async { [weak self] in
            let unwrap = model.images ?? ""
            let url = URL(string: unwrap)!
            if let data = try? Data(contentsOf: url) {
                self?.mangaImage.image = UIImage(data: data)
            }
        }
        yearLabel.text = String(model.score ?? 0)
        genreLabel.text = model.genres?.first?.name
        titleLabel.text = model.titleEnglish
        
    }
}
