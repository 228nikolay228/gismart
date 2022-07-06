//
//  TimeCounterView.swift
//  testGismart
//
//  Created by Николай on 30.06.22.
//

import UIKit
import SnapKit

final class TimeCounterView: UIView {

    private enum Dimensions {
        static let cornerRadius: CGFloat = 8
        static let backgroundColor: UIColor =  .white.withAlphaComponent(0.15)
    }

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Arial-Black", size: 15)
        label.textColor = .white
        return label
    }()

    init(title: String) {
        super.init(frame: .zero)

        titleLabel.text = title
        configure()
    }

    required init?(coder: NSCoder) { requiredInit }

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubviews()
        setupLayout()
    }

    func setLabelText(text: String) {
        if titleLabel.text != text {
            UIView.transition(
                with: self,
                duration: 0.3,
                options: .transitionFlipFromTop,
                animations: nil,
                completion: nil
            )
        }

        titleLabel.text = text
    }
}

// MARK: - private func
private extension TimeCounterView {

    func addSubviews() {
        addSubview(titleLabel)
    }

    func configure() {
        backgroundColor = Dimensions.backgroundColor
        layer.cornerRadius = Dimensions.cornerRadius
    } 

    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


