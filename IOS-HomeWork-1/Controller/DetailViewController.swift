//
//  DetailViewController.swift
//  IOS-HomeWork-1
//
//  Created by MacBook Pro on 14/5/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let name = MakeView.shared.makeLabel(font: .systemFont(ofSize: 25, weight: .medium))
    
    private let titleLabel = MakeView.shared.makeLabel(font: .systemFont(ofSize: 15, weight: .regular))
    
    private let image = UIImageView()
    
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        addView()
        addConstains()
        updateProductInfo()
    }
    
    private func addView() {
        view.addSubview(name)
        view.addSubview(titleLabel)
        view.addSubview(image)
    }
    
    private func addConstains() {
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func updateProductInfo() {
        name.text = product?.title
        titleLabel.text = product?.description
        image.downloaded(from: product?.images[0] ?? "https://i.dummyjson.com/data/products/1/1.jpg")
    }

}
