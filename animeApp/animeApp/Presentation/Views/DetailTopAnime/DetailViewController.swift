//
//  DetailViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 4/8/23.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func searchLink(url: URL)
    func showAlert(alert: String)
}

final class DetailViewController: UIViewController {
    
    //MARK: Properties
    var detailViewModel: DetailViewModelProtocol?
    var model: TopAnimeDataVO = TopAnimeDataVO(malID: nil, image: nil, year: nil, titleEnglish: nil, url: nil, episodes: nil, status: nil, airing: nil, duration: nil, score: nil, synopsis: nil, season: nil, genre: nil)
    var urlString: String = " "
    var rootViewModel: RootViewModel
    
    @IBOutlet private var principalView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var animeImage: UIImageView!
    @IBOutlet private weak var horizontalAiringStack: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!
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
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet private weak var urlLabel: UILabel!
    
    @IBAction func onPressURLButton(_ sender: Any) {
        if let url = URL(string:urlString) {
            detailViewModel?.onPressUrl(isValid: true, urlShared: url)
        } else {
            detailViewModel?.onPressUrl(isValid: false, urlShared: nil)
        }
    }
    
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
        configureButton()
        configureAiringLabel()
        configureScoreImage()
        generalConfiguration(label: descriptionLabel, description: " Description: ")
        generalConfiguration(label: scoreLabel, description: " Score: ")
        generalConfiguration(label: seasonLabel, description: " Season: ")
        generalConfiguration(label: yearLabel, description: " Year: ")
        generalConfiguration(label: typeLabel, description: " Genre: ")
        configureUrlLabel()
        configureUrlButton()
        verticalStackView.spacing = 5.0
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
        if airingLabel.text == "false" {
            airingLabel.text = " Finished airing"
        } else {
            airingLabel.text = " On airing"
        }
        
    }
    
    private func configureButton() {
        airingButton.tintColor = .clear
        airingButton.layer.cornerRadius = 10
        airingButton.layer.borderWidth = 11
        airingButton.layer.borderColor = UIColor.black.cgColor
        
        airingLabel.layer.cornerRadius = 30
        if airingLabel.text == "false" {
            airingButton.layer.borderColor = UIColor.red.cgColor
        } else {
            airingButton.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    private func configureUrlLabel() {
        urlLabel.text = "For more information:"
        urlLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private func configureUrlButton() {
        urlButton.setTitle("Anime link", for: .normal)
        urlButton.contentHorizontalAlignment = .left
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
        urlString = model.url ?? " "
        
    }
}

// MARK: - DetailViewControllerProtocol extension
extension DetailViewController: DetailViewControllerProtocol {
    
    func searchLink(url: URL) {
        UIApplication.shared.open(url)
    }
    
    func showAlert(alert: String) {
        let controller = UIAlertController(title: "URL not found", message: alert, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        controller.addAction(action)
        DispatchQueue.main.async {
          self.present(controller, animated: true, completion: nil)
        }
      }

}
