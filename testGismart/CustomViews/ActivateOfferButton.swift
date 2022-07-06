//
//  ActivateOfferButton.swift
//  testGismart
//
//  Created by Николай on 3.07.22.
//

import UIKit

final class ActivateOfferButton: UIButton {

    private lazy var gradientLayer: CAGradientLayer = {
        let sublayer = CAGradientLayer()
        sublayer.frame = self.bounds
        sublayer.colors = [
            UIColor(red: 65/255, green: 69/255, blue: 152/255, alpha: 1).cgColor,
            UIColor(red: 234/255, green: 72/255, blue: 187/255, alpha: 1).cgColor
        ]
        sublayer.startPoint = CGPoint(x: 0, y: 0.2)
        sublayer.endPoint = CGPoint(x: 0, y: 1)
        sublayer.cornerRadius = 12
        layer.insertSublayer(sublayer, at: 0)
        return sublayer
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) { requiredInit }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private func configure() {
        layer.cornerRadius = 12
        setTitle("ACTIVATE OFFER", for: .normal)
        setTitleColor(.white, for: .normal)
    }
}
