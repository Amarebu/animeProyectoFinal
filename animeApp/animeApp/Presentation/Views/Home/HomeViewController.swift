//
//  HomeView.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import UIKit

final class HomeViewController : UIViewController {
    
    var homeViewModel: HomeViewModel?
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        // homeCollectionView.backgroundColor = .white
        configureCollectionView()
        registerCells()
        homeViewModel?.getTopAnimes { [weak self] in
            self?.homeCollectionView.reloadData()
        }
    }
    
    private func registerCells() {
        let name = String(describing: HomeCollectionViewCell.self)
        let nib = UINib(nibName: name, bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "homeCellReuseIdentifier")
    }
    
    //MARK: - Collection View -
    
    private func configureCollectionView() {
        let layout = configureLayout()
        homeCollectionView.dataSource = self
        homeCollectionView.collectionViewLayout = layout
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = getItemSize()
        
        return layout
    }
    
    private func getItemSize() -> CGSize {
        return CGSize(width: 150, height: 280)
    }
    
    private func setViewModel() {
        let remoteDataSource = TopAnimeRemoteDataSourceImpl()
        let repository = getTopAnimesRepositoryImpl(topAnimeRemoteDataSource: remoteDataSource)
        self.homeViewModel = HomeViewModel(repository: repository, homeView: self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.onNeeedTopAnimes().count  ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellReuseIdentifier", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = homeViewModel?.onNeeedTopAnimes()[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        //cell.layer.borderWidth = 1.0
        //cell.layer.borderColor =   CGColor(red: 0, green: 0, blue: 0, alpha: 50)
        //cell.layer.cornerRadius = 10
        cell.layer.addSublayer(addDashedBorder())
        cell.setUp(model: model)

        return cell
    }
    
    private func addDashedBorder() -> CALayer {
        let color = UIColor.black.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let shapeRect = CGRect(x: 0, y: 0, width: 150, height: 280)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: 150/2, y: 280/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.cornerRadius = 10
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 4).cgPath
        
        return shapeLayer
    }
}
