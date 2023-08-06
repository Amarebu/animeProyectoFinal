//
//  DetailViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 4/8/23.
//

import UIKit


final class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var horizontalAiringStack: UIStackView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var airingButton: UIButton!
    @IBOutlet weak var airingLabel: UILabel!
    @IBOutlet weak var horizontalScoreStackView: UIStackView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var horizontalSeasonYearStackView: UIStackView!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
