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
    
    // MARK: - ViewModel
    var loginViewModel: LoginViewModel?
    

    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
    }
    
    private func setViewModel() {
       // let remoteDataSource = RemoteDataSourceImpl()
       // let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        self.loginViewModel = LoginViewModel(loginView: self)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        guard let provePassword = passwordTextField.text else {
            print("hello")
            return
        }
        
        guard let proveUser = usermailTextField.text else {
            print("helloUser")
            return
        }
        
        loginViewModel?.login(user: proveUser, pasword: provePassword)
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
