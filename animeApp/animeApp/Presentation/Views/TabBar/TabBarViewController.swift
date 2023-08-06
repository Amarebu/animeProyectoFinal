//
//  TabBarViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 4/8/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        // homeView
        let homeViewController = HomeViewController(nibName: "HomeView", bundle: nil)
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
