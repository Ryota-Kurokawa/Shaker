//
//  ShakerScreen.swift
//  Shaker
//
//  Created by 黒川良太 on 2024/02/23.
//

import SwiftUI

struct ShakerScreen: View {
    @State private var shakerValue: Int = 0
    
    let motionManager = MotionManager()
    var body: some View {
        Button ("Start") {
            motionManager.startMonitoringDeviceMotion()
        }
        Button ("Stop") {
            motionManager.stopMonitoringDeviceMotion()
        }
    }
}

#Preview {
    ShakerScreen()
}
