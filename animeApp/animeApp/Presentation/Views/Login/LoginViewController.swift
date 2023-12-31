//
//  LoginViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var usermailTextField: UITextField!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameAppLabel: UILabel!
    
    // MARK: - ViewModel
    var loginViewModel: LoginViewModel?
    var rootViewModel: RootViewModel
    
    // MARK: - Lifecycle
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        setupUserMail()
        setupPersonImage()
        configureNameApp()
    }
    
    private func configureNameApp() {
        nameAppLabel.text = "Anime APP"
        nameAppLabel.font = .boldSystemFont(ofSize: 40)
        nameAppLabel.textAlignment = .center
        nameAppLabel.textColor = UIColor(named: "lightPink") ?? .black
    }
    private func setupUserMail() {
        usermailTextField.placeholder = NSLocalizedString("usermailFormPlaceHolder", comment: "")
    }
    
    private func setupPersonImage() {
        personImage.image = UIImage(systemName: "person.circle")?.withTintColor(UIColor(named: "lightPink") ?? .black)
    }
    
    private func setViewModel() {
        let remoteDataSource = TopAnimeRemoteDataSourceImpl()
        let repository = GetTopAnimesRepositoryImpl(topAnimeRemoteDataSource: remoteDataSource)
        
        let mangaRemoteDataSource = TopMangaRemoteDataSourceImpl()
        let mangaRepository = GetTopMangaRepositoryImpl(topMangaRemoteDataSource: mangaRemoteDataSource)
        self.loginViewModel = LoginViewModel(loginView: self, repositoryteData: repository, mangaRepositoryData: mangaRepository)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        guard let provePassword = passwordTextField.text else {
            return
        }
        
        guard let proveUser = usermailTextField.text else {
            return
        }
        
        loginViewModel?.login(user: proveUser, pasword: provePassword)
    }
    
    func navigateToHome() {
        usermailTextField.text = ""
        passwordTextField.text = ""
        rootViewModel.activeView = .home
    }
    
    func showAlert(alert: String) {
        let controller = UIAlertController(title: "ERROR", message: alert, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        controller.addAction(action)
        DispatchQueue.main.async {
          self.present(controller, animated: true, completion: nil)
        }
      }
}
