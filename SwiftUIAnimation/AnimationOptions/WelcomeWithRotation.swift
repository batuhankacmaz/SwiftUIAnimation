//
//  WelcomeWithRotation.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct WelcomeWithRotation: View {
    @State private var isStart: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Dark"), Color("Darkest")], center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                Text("Welcome!")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(Color("Gold"))
                    .onAppear {
                        isStart = true
                    }
                    .opacity(isStart ? 1 : 0)
                    .animation(.easeIn(duration: 1), value: isStart)
                Spacer()
                
                GeometryReader { geometry in
                    Button(action: {}) {
                        Circle()
                            .overlay(
                            Image(systemName: "arrow.right")
                                .font(.system(size: 50, weight: .bold))
                                .tint(.black)
                            )
                    }
                    .tint(Color("Accent"))
                    .overlay(
                        Circle()
                            .stroke(Color("Gold"), lineWidth: 5)
                            .opacity(isStart ? 0 : 1)
                            .scaleEffect(isStart ? 1.8 : 1.3)
                            .animation(.easeOut(duration: 1).repeatCount(5).delay(1), value: isStart)
                    )
                    .rotationEffect(Angle.degrees(isStart ? 0 : -270))
                    .offset(x: isStart ? geometry.size.width : 0)
                    .animation(.easeOut(duration: 1).delay(1), value: isStart)
                    

                }
                .offset(x: -100)
                .frame(height: 80)
            }
        }
    }
}

struct WelcomeWithRotation_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeWithRotation()
    }
}
