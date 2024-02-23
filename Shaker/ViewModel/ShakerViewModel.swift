//
//  ShareViewModel.swift
//  Shaker
//
//  Created by 黒川良太 on 2024/02/22.
//

import Foundation

class ShakerViewModel: ObservableObject {
    @Published var counter: Int = 0
//    @Published private var timer: Timer = Timer()
    
    func startTimer(seconds: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
