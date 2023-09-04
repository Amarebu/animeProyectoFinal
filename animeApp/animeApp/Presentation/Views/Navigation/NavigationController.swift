//
//  NavigationController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 7/8/23.
//

import UIKit

class NavigationController: UINavigationController {
    var rootViewController: UIViewController
    
    override init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.backgroundColor = .cyan
    }
}
