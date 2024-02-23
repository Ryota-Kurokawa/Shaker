//
//  ShakeScreen.swift
//  Shaker
//
//  Created by 黒川良太 on 2024/02/22.
//

import SwiftUI

struct ShakeScreen: View {
    let shakerViewModel = ShakerViewModel()
    @State var number: Int = 0
    
    
    var body: some View {
        Text("Shake the device to generate a random number.")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
        TextField("number", value: $number, formatter: NumberFormatter())
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .padding()
        Button(action: {
            print("start")
            shakerViewModel.startTimer(seconds: TimeInterval(number)) {
                print("Timer completed!")
                print(shakerViewModel.counter)
            }
        }, label: {
            Text("timer")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        })
    }
}

#Preview {
    ShakeScreen()
}
