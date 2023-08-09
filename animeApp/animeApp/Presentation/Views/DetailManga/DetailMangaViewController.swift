//
//  DetailMangaViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import UIKit

protocol DetailMangaViewControllerProtocol: AnyObject {
    
}

final class DetailMangaViewController: UIViewController {
    
    var detailViewModel: DetailMangaViewModelProtocol?
    var model: TopMangaDataVO = TopMangaDataVO(malID: nil, url: nil, images: nil, titleEnglish: nil, chapters: nil, status: nil, score: nil, synopsis: nil, genres: nil)
    var rootViewModel: RootViewModel
    
    @IBOutlet private var principalView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mangaImage: UIImageView!
    @IBOutlet private weak var horizontalAiringStack: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var airingButton: UIButton!
    @IBOutlet private weak var airingLabel: UILabel!
    @IBOutlet private weak var horizontalScoreStackView: UIStackView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var scoreImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var urlLabel: UILabel!
    
    
    // MARK: - Lifecycle
    init(rootViewModel: RootViewModel, model: TopMangaDataVO) {
        self.model = model
        self.rootViewModel = rootViewModel
        super.init(nibName: "DetailMangaViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetail(model: model)
        setViewModel()
        configureTitleLabel()
        configureButton()
        configureAiringLabel()
        configureScoreImage()
        generalConfiguration(label: descriptionLabel, description: " Description: ")
        generalConfiguration(label: scoreLabel, description: " Score: ")
        generalConfiguration(label: typeLabel, description: " Genre: ")
        verticalStackView.spacing = 5.0
    }
    
    private func setViewModel() {
        let remoteDataSource = TopMangaRemoteDataSourceImpl()
        let repository = GetTopMangaRepositoryImpl(topMangaRemoteDataSource: remoteDataSource)
        self.detailViewModel = DetailMangaViewModel(repository: repository, viewDelegate: self)
    }
    

    private func configureTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
    }
    
    private func configureScoreImage() {
        switch( Double(scoreLabel.text ?? "0")) ?? 0 {
        case 9...10:
            scoreImage.image = UIImage(named: "fiveStart")
        case 7...9:
            scoreImage.image = UIImage(named: "fourStarts")
        case 5...7:
            scoreImage.image = UIImage(named: "threeStarts")
        case 2.5...5:
            scoreImage.image = UIImage(named: "twoStarts")
        default:
            scoreImage.image = UIImage(named: "oneStart")
        }
    }
    
    private func configureAiringLabel() {
        if airingLabel.text == "Finished" {
            airingLabel.text = " Finished airing"
        } else {
            airingLabel.text = " On airing"
        }
        
    }
    
    private func configureButton() {
        airingButton.tintColor = .clear
        airingButton.layer.cornerRadius = 10
        airingButton.layer.borderWidth = 15
        airingButton.layer.borderColor = UIColor.black.cgColor
        
        airingLabel.layer.cornerRadius = 30
        if airingLabel.text == "Finished" {
            airingButton.layer.borderColor = UIColor.red.cgColor
        } else {
            airingButton.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    private func generalConfiguration(label: UILabel, description: String) {
        let boldText = description
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)

        guard let normalText = label.text else { return }
        let normalString = NSMutableAttributedString(string:normalText)

        attributedString.append(normalString)
        label.attributedText = attributedString
        
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
    }
    
    func setUpDetail(model: TopMangaDataVO) {
        
        titleLabel.text = model.titleEnglish
        DispatchQueue.main.async { [weak self] in
            let unwrap = model.images ?? ""
            guard let url = URL(string: unwrap) else {
                return
            }
            if let data = try? Data(contentsOf: url) {
                self?.mangaImage.image = UIImage(data: data)
            }
        }
        
        var genresT: String = ", "
        model.genres?.forEach{ genre in
            genresT.append(genre.name ?? "")
        }
        
        airingLabel.text = "\(model.status ?? "false")"
        typeLabel.text = model.genres?.first?.name
        scoreLabel.text = String(model.score ?? 1.0)
        descriptionLabel.text = model.synopsis
        urlLabel.text = model.url
        
    }
}

// MARK: - DetailViewControllerProtocol extension
extension DetailMangaViewController: DetailMangaViewControllerProtocol {
    
}
