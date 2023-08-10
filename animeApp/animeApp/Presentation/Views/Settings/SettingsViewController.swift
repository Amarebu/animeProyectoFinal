//
//  SettingsViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 10/8/23.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {
    func searchLink(url: URL)
}

class SettingsViewController: UIViewController {
    
    //MARK: Properties
    var detailViewModel: SettingsViewModelProtocol?
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var usernameImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var userHorizontalStack: UIStackView!
    @IBOutlet weak var userVerticalStack: UIStackView!
    @IBOutlet weak var contactMeButton: UIButton!
    @IBOutlet weak var contactMeHorizontalStack: UIStackView!
    @IBAction func onPressContactMe(_ sender: Any) {
        detailViewModel?.onPressUrl(urlShared: "https://github.com/Amarebu")
    }
    
    // MARK: - Lifecycle
    init() {
        super.init(nibName: "SettingsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        configureUserLabel()
        configureUsernameImage()
        configureUsernameLabel()
        configureContactMeLabel()
        configureContactMeButton()
        configurecontactMeHorizontalStack()
        configureUsernameHorizontalStack()
    }
    
    private func setViewModel() {
        self.detailViewModel = SettingsViewModel(viewDelegate: self)
    }
    
    private func configureUserLabel() {
        userLabel.text = "User"
        userLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private func configureUsernameImage() {
        usernameImage.image = UIImage(systemName: "person.crop.circle.fill")
        usernameImage.frame.size = CGSize(width: 50, height: 50)
        usernameImage.tintColor = UIColor(named: "lightPink") ?? .black
    }
    
    private func configureUsernameLabel() {
        usernameLabel.text = "Amarebu"
        usernameLabel.textAlignment = .left
    }
    
    private func configureContactMeLabel() {
        contactLabel.text = "Information"
         contactLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private func configureContactMeButton() {
        contactMeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        contactMeButton.setTitle("Contact Develper", for: .normal)
        contactMeButton.contentHorizontalAlignment = .center
        contactMeButton.tintColor = UIColor(named: "lightPink") ?? .black
    }
    
    private func configurecontactMeHorizontalStack() {
        contactMeHorizontalStack.backgroundColor = UIColor(named: "backgroundSettings")?.withAlphaComponent(0.3)
        contactMeHorizontalStack.layer.cornerRadius = 10
    }
    
    private func configureUsernameHorizontalStack() {
        userHorizontalStack.backgroundColor = UIColor(named: "backgroundSettings")?.withAlphaComponent(0.3)
        userHorizontalStack.layer.cornerRadius = 10
    }
}


// MARK: - DetailViewControllerProtocol extension
extension SettingsViewController: SettingsViewControllerProtocol {
    func searchLink(url: URL) {
        UIApplication.shared.open(url)
        print("hekk")
    }
}

