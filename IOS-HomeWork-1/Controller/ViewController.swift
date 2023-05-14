//
//  ViewController.swift
//  IOS-HomeWork-1
//
//  Created by MacBook Pro on 13/5/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 183, height: 211)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private var data: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionUpdate()
        addConstrains()
        apiUpdate()
    }
    
    private func extensionUpdate() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell
            .self, forCellWithReuseIdentifier: "cell")
    }
    
    private func apiUpdate() {
        ProductManager.shared.getRequest { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.data = data.products
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func addConstrains() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(5)
        }
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        let model = data[indexPath.row]
        cell.setDate(image: model.images[0], name: model.brand, text: model.description)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.product = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
