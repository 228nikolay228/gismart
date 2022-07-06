//
//  ModalViewController.swift
//  testGismart
//
//  Created by Николай on 5.07.22.
//

import UIKit
import SnapKit

final class ModalViewController: UIViewController {

    private var checkView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 14/255, blue: 78/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()

    private var greatLabel: UILabel = {
        let label = UILabel()
        label.text = "Great!"
        label.textAlignment = .center
        label.textColor = .white
        label.font =  UIFont(name: "OpenSans-Semibold", size: 25)
        return label
    }()

    private var offerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font =  UIFont(name: "OpenSans-Semibold", size: 16)
        return label
    }()

    init(time: String) {
        super.init(nibName: nil, bundle: nil)
        offerLabel.text = "Offer activated at \(time)"
    }

    required init?(coder: NSCoder) { requiredInit }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        addSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLayout()
        setupShadow()
    }
}

private extension ModalViewController {
    func addSubviews() {
        checkView.addSubview(greatLabel)
        checkView.addSubview(offerLabel)
        view.addSubview(checkView)
    }

    func setupLayout() {
        checkView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(view.frame.width / 3.5)
            $0.height.equalTo(view.frame.height / 3)
        }
        greatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.centerX.equalToSuperview()
        }
        offerLabel.snp.makeConstraints {
            $0.top.equalTo(greatLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }

    func setupShadow() {
        greatLabel.setupModalWindowShadow(
            color: .white,
            radius: 3.0,
            opacity: 1.0,
            offset: CGSize(width: 1, height: 1)
        )
    }
}
