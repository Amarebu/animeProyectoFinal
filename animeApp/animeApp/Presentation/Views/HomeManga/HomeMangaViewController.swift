//
//  HomeViewController.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import UIKit

final class HomeMangaViewController : UIViewController, ObservableObject {
    
    var homeViewModel: HomeMangaViewModel?
    var rootViewModel: RootViewModel
    
    
    @IBOutlet weak var homeMangaCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
        super.init(nibName: "HomeMangaViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewModel() {
        let remoteDataSource = TopMangaRemoteDataSourceImpl()
        let repository = GetTopMangaRepositoryImpl(topMangaRemoteDataSource: remoteDataSource)
        self.homeViewModel = HomeMangaViewModel(repository: repository, homeView: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        configureCollectionView()
        registerCells()
        homeViewModel?.getTopManga { [weak self] in
            self?.homeMangaCollectionView.reloadData()
        }
    }
    
    private func registerCells() {
        let name = String(describing: HomeMangaCollectionViewCell.self)
        let nib = UINib(nibName: name, bundle: nil)
        homeMangaCollectionView.register(nib, forCellWithReuseIdentifier: "homeMangaCellReuseIdentifier")
    }
    
    //MARK: - Collection View -
    
    private func configureCollectionView() {
        let layout = configureLayout()
        homeMangaCollectionView.dataSource = self
        homeMangaCollectionView.collectionViewLayout = layout
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
    
}

extension HomeMangaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.onNeeedTopManga().count  ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeMangaCellReuseIdentifier", for: indexPath) as? HomeMangaCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = homeViewModel?.onNeeedTopManga()[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.layer.addSublayer(addDashedBorder())
        cell.setUpManga(model: model)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = homeViewModel?.onNeeedTopManga()[indexPath.row] else {
            return
        }
        rootViewModel.activeView = .detailManga(model: model)
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
    
