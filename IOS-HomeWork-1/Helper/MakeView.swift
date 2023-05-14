//
//  MakeView.swift
//  IOS-HomeWork-1
//
//  Created by MacBook Pro on 14/5/23.
//

import UIKit


class MakeView {
    static let shared = MakeView()
    
    func makeLabel(text: String = "",
                   textColor: UIColor = .darkText,
                   font: UIFont = .systemFont(ofSize: 15, weight: .regular),
                   bgColor: UIColor = .white,
                   numberOfLine: Int = 0,
                   aligment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = bgColor
        label.numberOfLines = numberOfLine
        label.textAlignment = aligment
        return label
    }
}
