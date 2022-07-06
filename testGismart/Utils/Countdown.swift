//
//  Countdown.swift
//  testGismart
//
//  Created by Николай on 6.07.22.
//

import Foundation

class Countdown {
    var record: TimeInterval = 0
    var seconds: TimeInterval {
        didSet {
            if seconds > record {
                record = seconds
                recordChanged?(record)
            }
        }
    }

    private weak var timer: Timer?

    var recordChanged: ((TimeInterval) -> Void)?
    var changed: ((TimeInterval) -> Void)?
    var ended: (() -> Void)?

    var isPaused = true

    var timerUpdateSeconds: Double = 1

    init(_ seconds: TimeInterval = 0) {
        self.seconds = seconds
        self.record = seconds
    }

    deinit {
        self.invalidate()
    }

    func schedule(with time: TimeInterval) {
        self.seconds = time
        self.record = seconds
        schedule()
    }

    func schedule() {
        isPaused = false
        invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: timerUpdateSeconds,
            target: self,
            selector: #selector(action),
            userInfo: nil,
            repeats: true
        )
        changed?(seconds)
    }

    @objc func action() {
        seconds -= timerUpdateSeconds // 1
        changed?(seconds)

        if seconds <= 0 {
            invalidate()
            ended?()
        }
    }

    func pause() {
        isPaused = true
        invalidate()
    }

    func resume() {
        schedule()
    }

    func toggle() {
        isPaused ? resume() : pause()
    }

    func invalidate() {
        timer?.invalidate()
        timer = nil
    }
}
