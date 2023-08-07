//
//  DetailViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 4/8/23.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    
}

final class DetailViewController: UIViewController {
    
    var detailViewModel: DetailViewModelProtocol?
    var model: TopAnimeDataVO = TopAnimeDataVO(malID: nil, image: nil, year: nil, titleEnglish: nil, url: nil, episodes: nil, status: nil, airing: nil, duration: nil, score: nil, synopsis: nil, season: nil, genre: nil)
    var rootViewModel: RootViewModel
    
    @IBOutlet private var principalView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var animeImage: UIImageView!
    @IBOutlet private weak var horizontalAiringStack: UIStackView!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var airingButton: UIButton!
    @IBOutlet private weak var airingLabel: UILabel!
    @IBOutlet private weak var horizontalScoreStackView: UIStackView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var scoreImage: UIImageView!
    @IBOutlet private weak var horizontalSeasonYearStackView: UIStackView!
    @IBOutlet private weak var seasonLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var urlLabel: UILabel!
    

    // MARK: - Lifecycle
    init(rootViewModel: RootViewModel, model: TopAnimeDataVO) {
        self.model = model
        self.rootViewModel = rootViewModel
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetail(model: model)
        setViewModel()
        configureTitleLabel()
        configureDescriptionLabel()
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    private func setViewModel() {
        let remoteDataSource = TopAnimeRemoteDataSourceImpl()
        let repository = GetTopAnimesRepositoryImpl(topAnimeRemoteDataSource: remoteDataSource)
        self.detailViewModel = DetailViewModel(repository: repository, viewDelegate: self)
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
    }
    
    private func configureDescriptionLabel() {
        let boldText = "Description: "
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)

        guard let normalText = descriptionLabel.text else { return }
        let normalString = NSMutableAttributedString(string:normalText)

        attributedString.append(normalString)
        descriptionLabel.attributedText = attributedString
        
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 0
    }
    
    
    func setUpDetail(model: TopAnimeDataVO) {
        
        titleLabel.text = model.titleEnglish
        DispatchQueue.main.async { [weak self] in
            let unwrap = model.image ?? ""
            guard let url = URL(string: unwrap) else {
                return
            }
            if let data = try? Data(contentsOf: url) {
                self?.animeImage.image = UIImage(data: data)
            }
        }
        airingLabel.text = "\(model.airing ?? false)"
        typeLabel.text = model.genre?.first?.name
        scoreLabel.text = String(model.score ?? 1.0)
        seasonLabel.text = model.season
        yearLabel.text = "\(String(model.year ?? 0))"
        descriptionLabel.text = model.synopsis
        urlLabel.text = model.url
        
    }
}

// MARK: - DetailViewControllerProtocol extension
extension DetailViewController: DetailViewControllerProtocol {
    
}
