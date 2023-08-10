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
        let homeViewController = HomeViewController(rootViewModel: rootViewModel)
        homeViewController.tabBarItem = UITabBarItem(title: "Top Animes", image: UIImage(systemName: "suit.spade.fill"), tag: 0)
        
        // homeMangaView
        
        let mangaViewController = HomeMangaViewController(rootViewModel: rootViewModel)
        mangaViewController.tabBarItem = UITabBarItem(title: "Top Mangas", image: UIImage(systemName: "suit.club.fill"), tag: 1)

        // Asignar los viewcontrollers al tabBar, el orden de los view controllers
        self.title = "MyAnimeList"
        navigationItem.hidesBackButton = true
        self.viewControllers = [homeViewController,mangaViewController]
        // setLogOutButton()
        
    }
    
    @objc private func logout() {
        NotificationCenter.default.post(name: .deleteToken, object:  nil, userInfo: nil)
        navigationController?.popViewController(animated: true)
        
    }
}
