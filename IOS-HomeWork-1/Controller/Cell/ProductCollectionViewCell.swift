//
//  ProductTableViewCell.swift
//  IOS-HomeWork-1
//
//  Created by MacBook Pro on 13/5/23.
//

import UIKit


class ProductCollectionViewCell: UICollectionViewCell {
    private let bgView = UIView()
    
    private let image = UIImageView()
    
    private let label = MakeView.shared.makeLabel(font: .systemFont(ofSize: 17, weight: .medium))
    
    private let descrip = MakeView.shared.makeLabel( font: .systemFont(ofSize: 12, weight: .regular))
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addView()
        addConstraints()
    }
    
    private func addView() {
        contentView.addSubview(bgView)
        bgView.addSubview(label)
        bgView.addSubview(image)
        bgView.addSubview(descrip)
    }
    
    private func addConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(116)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        descrip.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview()
        }
    }
    
    func setDate(image: String, name: String, text: String) {
        self.image.downloaded(from: image)
        label.text = name
        descrip.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
