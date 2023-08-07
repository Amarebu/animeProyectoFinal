//
//  TabBarViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 4/8/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    var rootViewModel: RootViewModel
    
    // MARK: - Lifecycle
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
        super.init(nibName: "TabBarViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        // homeView
        //let homeViewController = HomeViewController(nibName: "HomeView", bundle: nil, rootViewModel: rootViewModel)
        let homeViewController = HomeViewController(rootViewModel: rootViewModel)
        homeViewController.tabBarItem = UITabBarItem(title: "Top Animes", image: UIImage(named: "Top Animes"), tag: 0)
        
        // Settings
        
//        let settingsViewController = SettingsViewController(nibName: "SetttingsView", bundle: nil)
//        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "Settings"), tag: 1)
//
        // Asignar los viewcontrollers al tabBar, el orden de los view controllers
        self.title = "Top Animes"
        navigationItem.hidesBackButton = true
        self.viewControllers = [homeViewController]
        // setLogOutButton()
        
    }
    
//    private func setLogOutButton() {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
//    }
    
    @objc private func logout() {
        NotificationCenter.default.post(name: .deleteToken, object:  nil, userInfo: nil)
        navigationController?.popViewController(animated: true)
        
    }
}
