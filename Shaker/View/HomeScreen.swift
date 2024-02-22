//
//  HomeScreen.swift
//  Shaker
//
//  Created by 黒川良太 on 2024/02/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var shakerValue: Int = 0
    @State private var isPresented: Bool = false
    @State private var isLarge: Bool = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Shaker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text("Shake the device to generate a random number.")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text("\(shakerValue)")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Shake")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Shaker"), message: Text("Shake the device to generate a lerger number."), dismissButton: .default(Text("OK")))
                })
                Spacer()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
