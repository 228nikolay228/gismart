//
//  CustomStackView.swift
//  testGismart
//
//  Created by Николай on 30.06.22.
//

import UIKit
import SnapKit

final class TimerStackView: UIView {

    private enum Dimensions {
        static let spacing: CGFloat = 3
        static let customViewWidthIfIphoneSE: CGFloat = 40
        static let customViewWidthIfIphone13: CGFloat = 60
        static let customViewWidthIfIpadPro: CGFloat = 86
    }

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Dimensions.spacing
        return stack
    }()

    var customView1: TimeCounterView = {
        let view = TimeCounterView(title: "00")
        return view
    }()

    private var label1: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()

    var customView2: TimeCounterView = {
        let view = TimeCounterView(title: "00")
        return view
    }()

    private var label2: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()

    var customView3: TimeCounterView = {
        let view = TimeCounterView(title: "00")
        return view
    }()

    private var label3: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()

    var customView4: TimeCounterView = {
        let view = TimeCounterView(title: "00")
        return view
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
}

private extension TimerStackView {
    func addSubviews() {
        stackView.addArrangedSubview(customView1)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(customView2)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(customView3)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(customView4)
        addSubview(stackView)
    }

    func setupLayout() {
        let deviceType = UIDevice.current.screenType
        switch deviceType {
        case .iphoneSE:
            confureLayoutForDevice(for: Dimensions.customViewWidthIfIphoneSE)
        case .iphone13:
            confureLayoutForDevice(for: Dimensions.customViewWidthIfIphone13)
        case .iPadPro:
            confureLayoutForDevice(for: Dimensions.customViewWidthIfIpadPro)
        case .unknown:
            confureLayoutForDevice(for: Dimensions.customViewWidthIfIphone13)
        }
    }

    func confureLayoutForDevice(for width: CGFloat) {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        customView1.snp.makeConstraints {
            $0.width.equalTo(width)
        }
        customView2.snp.makeConstraints {
            $0.width.equalTo(width)
        }
        customView3.snp.makeConstraints {
            $0.width.equalTo(width)
        }
        customView4.snp.makeConstraints {
            $0.width.equalTo(width)
        }
    }
}
