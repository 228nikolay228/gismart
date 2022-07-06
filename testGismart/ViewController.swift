//
//  ViewController.swift
//  testGismart
//
//  Created by Николай on 29.06.22.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let countdown = Countdown()

    private lazy var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "music")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var myView: MyView = {
        let view = MyView()
        return view
    }()

    private lazy var darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
    }

    required init?(coder: NSCoder) { requiredInit }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        setupConstraints()
        myView.set(delegate: self)
        setTimer(interval: TimeInterval(60 * 60 * 24))
    }

    @objc private func didEnterBackground() {
        countdown.pause()
    }

    @objc private func didBecomeActive() {
        countdown.resume()
    }
}

private extension ViewController {
    func setTimer(interval: TimeInterval) {
        countdown.schedule(with: interval)
        countdown.changed = { [weak self] in
            self?.setTimeToLabels(interval: $0)
        }

//        чтобы таймер стал цикличным
//        countdown.ended = { [weak self] in
//            self?.countdown.schedule(with: interval)
//        }
    }

    func setupSubviews() {
        view.backgroundColor = .black
        view.addSubview(musicImageView)
        view.addSubview(myView)
    }

    func setupConstraints() {
        let deviceType = UIDevice.current.screenType
        switch deviceType {
        case .iphoneSE:
            musicImageView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(30)
                $0.centerY.equalToSuperview()
                $0.height.equalTo(view.frame.height / 2)
                $0.width.equalTo(view.frame.width / 2)
            }
            myView.snp.makeConstraints {
                $0.leading.equalTo(musicImageView.snp.trailing).offset(120)
                $0.top.bottom.equalToSuperview()
            }
        case .iphone13:
            settingLayoutForDevice()
        case .iPadPro:
            musicImageView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(100)
                $0.centerY.equalToSuperview()
                $0.height.equalTo(view.frame.height / 2)
                $0.width.equalTo(view.frame.width / 2)
            }
            myView.snp.makeConstraints {
                $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(95)
                $0.top.equalToSuperview().inset(240)
                $0.bottom.equalToSuperview().inset(200)
                $0.height.equalTo(view.frame.height / 2)
                $0.width.equalTo(view.frame.width / 2)
            }
        case .unknown:
            settingLayoutForDevice()
        }
    }

    func settingLayoutForDevice() {
        musicImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(view.frame.height / 2)
            $0.width.equalTo(view.frame.width / 2)
        }
        myView.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(view.frame.height / 2)
            $0.width.equalTo(view.frame.width / 2)
        }
    }

    func setTimeToLabels(interval: TimeInterval) {
        myView.setupTime(interval.seconds, interval.minutes, interval.hours)
    }

    func getOfferActivationTime() -> (Int, Int) {
        countdown.pause()
        return (countdown.seconds.hours, countdown.seconds.minutes)
    }
}

extension ViewController: ActivateButtonDelegate {
    func showOffer() {
        let time = getOfferActivationTime()
        let modalVC = ModalViewController(time: "\(time.0):\(time.1)")
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: false)
    }
}
