//
//  MyView.swift
//  testGismart
//
//  Created by Николай on 3.07.22.
//

import UIKit
import SnapKit

protocol ActivateButtonDelegate: AnyObject {
    func showOffer()
}

struct Fonts {
    var lastMinuteLabelFontSize: CGFloat
    var offLabelFontSize: CGFloat
    var forTrueLabelFontSize: CGFloat
    var hundredsLabelFontSize: CGFloat
    var activateOfferButtonFontSize: CGFloat
    var privacyLabelFontSize: CGFloat
}

final class MyView: UIView {

    weak var delegate: ActivateButtonDelegate?
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

     private var lastMinuteLabel: UILabel = {
        let label = UILabel()
        label.text = "LAST-MINUTE CHANCE!\n     to claim your offer"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

     var offLabel: UILabel = {
        let label = UILabel()
        label.text = "90% OFF"
        label.textColor = .white
        return label
    }()

    private var forTrueLabel: UILabel = {
        let label = UILabel()
        label.text = "For true music fans"
        label.textColor = .white
        return label
    }()

    private var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private var oneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "00"
        return label
    }()

     var twoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

     var threeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "00"
        return label
    }()

     var fourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    var customStackView: TimerStackView = {
        let view = TimerStackView()
        return view
    }()

    private var hundredsLabel: UILabel = {
        let label = UILabel()
        label.text = "Hundreds of songs in your pocket"
        label.textColor = .gray
        return label
    }()

     private var activateOfferButton: ActivateOfferButton = {
        let button = ActivateOfferButton(type: .system)
        button.addTarget(self, action: #selector(actionActivateOffer), for: .touchUpInside)
        return button
    }()

    private var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()

    private var privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "Privacy"
        label.textColor = .gray
        return label
    }()

    private var restoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Restore"
        label.textColor = .gray
        return label
    }()

    private var termsLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms"
        label.textColor = .gray
        return label
    }()


    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func set(delegate: ActivateButtonDelegate) {
        self.delegate = delegate
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubviews()
        setupLayout()
        configureSize()
    }

    func setupTime(_ seconds: Int,_ minutes: Int,_ hours: Int) {
        customStackView.customView4.setLabelText(text: String(format: "%02d", seconds))
        customStackView.customView3.setLabelText(text: String(format: "%02d", minutes))
        customStackView.customView2.setLabelText(text: String(format: "%02d", hours))
    }
}

private extension MyView {
    func configureSize() {
        let deviceType = UIDevice.current.screenType
        switch deviceType {
        case .iphoneSE:
            cofigureForDevice(fontSize: Fonts(
                lastMinuteLabelFontSize: 17,
                offLabelFontSize: 40,
                forTrueLabelFontSize: 14,
                hundredsLabelFontSize: 12,
                activateOfferButtonFontSize: 12,
                privacyLabelFontSize: 10)
            )
            stackView.setCustomSpacing(10, after: offLabel)
            stackView.setCustomSpacing(6, after: forTrueLabel)
            stackView.setCustomSpacing(18, after: horizontalStackView)
        case .iphone13:
            cofigureForDevice(fontSize: Fonts(
                lastMinuteLabelFontSize: 22,
                offLabelFontSize: 55,
                forTrueLabelFontSize: 15,
                hundredsLabelFontSize: 14,
                activateOfferButtonFontSize: 15,
                privacyLabelFontSize: 10)
            )
            stackView.setCustomSpacing(12, after: offLabel)
            stackView.setCustomSpacing(8, after: forTrueLabel)
            stackView.setCustomSpacing(20, after: horizontalStackView)
        case .iPadPro:
            cofigureForDevice(fontSize: Fonts(
                lastMinuteLabelFontSize: 35,
                offLabelFontSize: 80,
                forTrueLabelFontSize: 20,
                hundredsLabelFontSize: 18,
                activateOfferButtonFontSize: 20,
                privacyLabelFontSize: 14)
            )
            stackView.setCustomSpacing(18, after: offLabel)
            stackView.setCustomSpacing(14, after: forTrueLabel)
            stackView.setCustomSpacing(26, after: horizontalStackView)
        case .unknown:
            cofigureForDevice(fontSize: Fonts(
                lastMinuteLabelFontSize: 22,
                offLabelFontSize: 55,
                forTrueLabelFontSize: 15,
                hundredsLabelFontSize: 14,
                activateOfferButtonFontSize: 15,
                privacyLabelFontSize: 10)
            )
            stackView.setCustomSpacing(12, after: offLabel)
            stackView.setCustomSpacing(8, after: forTrueLabel)
            stackView.setCustomSpacing(20, after: horizontalStackView)
        }
    }

    func cofigureForDevice(fontSize: Fonts) {
        lastMinuteLabel.font = UIFont(name: "OpenSans-Semibold", size: fontSize.lastMinuteLabelFontSize)
        offLabel.font = UIFont(name: "Arial-Black", size: fontSize.offLabelFontSize)
        forTrueLabel.font = UIFont(name: "OpenSans-Semibold", size: fontSize.forTrueLabelFontSize)
        hundredsLabel.font = UIFont(name: "OpenSans", size: fontSize.hundredsLabelFontSize)
        activateOfferButton.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: fontSize.activateOfferButtonFontSize)
        privacyLabel.font = UIFont(name: "OpenSans", size: fontSize.privacyLabelFontSize)
        restoreLabel.font = UIFont(name: "OpenSans", size: fontSize.privacyLabelFontSize)
        termsLabel.font = UIFont(name: "OpenSans", size: fontSize.privacyLabelFontSize)
    }

    func addSubviews() {
        stackView.addArrangedSubview(lastMinuteLabel)
        stackView.addArrangedSubview(offLabel)
        stackView.addArrangedSubview(forTrueLabel)
        addSubview(stackView)
        addSubview(customStackView)
        addSubview(hundredsLabel)
        addSubview(activateOfferButton)
        horizontalStack.addArrangedSubview(privacyLabel)
        horizontalStack.addArrangedSubview(restoreLabel)
        horizontalStack.addArrangedSubview(termsLabel)
        addSubview(horizontalStack)
    }

    func setupLayout() {
        let deviceType = UIDevice.current.screenType
        switch deviceType {
        case .iphoneSE:
            configureLayoutDevice(
                stackViewHeight: 31,
                buttonWidth: 200,
                buttonHeight: 50,
                horizontalStackInset: 23
            )
        case .iphone13:
            configureLayoutDevice(
                stackViewHeight: 41,
                buttonWidth: 300,
                buttonHeight: 63,
                horizontalStackInset: 30
            )
        case .iPadPro:
            stackView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.centerX.equalTo(self.snp.centerX)
            }
            customStackView.snp.makeConstraints {
                $0.top.equalTo(stackView.snp.bottom).offset(20)
                $0.centerX.equalTo(self.snp.centerX)
                $0.height.equalTo(57)
            }
            hundredsLabel.snp.makeConstraints {
                $0.top.equalTo(customStackView.snp.bottom).offset(25)
                $0.centerX.equalTo(self.snp.centerX)
            }
            activateOfferButton.snp.makeConstraints {
                $0.top.equalTo(hundredsLabel.snp.bottom).offset(25)
                $0.centerX.equalTo(self.snp.centerX)
                $0.width.equalTo(403)
                $0.height.equalTo(88)
            }
            horizontalStack.snp.makeConstraints {
                $0.centerX.equalTo(self.snp.centerX)
                $0.top.equalTo(activateOfferButton.snp.bottom).offset(20)
            }
        case .unknown:
            configureLayoutDevice(
                stackViewHeight: 41,
                buttonWidth: 300,
                buttonHeight: 63,
                horizontalStackInset: 30
            )
        }
    }

    func configureLayoutDevice(
        stackViewHeight: CGFloat,
        buttonWidth: CGFloat,
        buttonHeight: CGFloat,
        horizontalStackInset: CGFloat
    ) {
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(self.snp.centerX)
        }
        customStackView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(stackViewHeight)
        }
        hundredsLabel.snp.makeConstraints {
            $0.top.equalTo(customStackView.snp.bottom).offset(16)
            $0.centerX.equalTo(self.snp.centerX)
        }
        activateOfferButton.snp.makeConstraints {
            $0.top.equalTo(hundredsLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonHeight)
        }
        horizontalStack.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.bottom.equalToSuperview().inset(horizontalStackInset)
        }
    }

    @objc func actionActivateOffer() {
        delegate?.showOffer()
    }
}
