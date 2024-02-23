//
//  MonitorManager.swift
//  Shaker
//
//  Created by 黒川良太 on 2024/02/23.
//

import Foundation
import CoreMotion

final class MotionManager: ObservableObject {
    @Published private(set) var isTheftProtectionMode = false
    @Published private(set) var isVibrationActive = false
    @Published private var shakerValue: Int = 0

    private let motionManager = CMMotionManager()
    private var vibrationTimer: Timer?

    func startMonitoringDeviceMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.5
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
                guard let data = data else { return }
                let threshold: Double = 0.1
                let userAcceleration = data.userAcceleration
                if abs(userAcceleration.x) > threshold || abs(userAcceleration.y) > threshold || abs(userAcceleration.z) > threshold {
                    self?.shakerValue += 1
                    print("Shake detected! \(self?.shakerValue ?? 0)")
                }
            }
        }
    }

    func stopMonitoringDeviceMotion() {
        if motionManager.isDeviceMotionActive {
            motionManager.stopDeviceMotionUpdates()
            
        }
    }

//    private func startVibration() {
//        isVibrationActive = true
//        vibrationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            if self.isVibrationActive {
//                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            } else {
//                self.vibrationTimer?.invalidate()
//                self.vibrationTimer = nil
//            }
//        }
//    }

//    private func stopVibration() {
//        isVibrationActive = false
//    }
}
