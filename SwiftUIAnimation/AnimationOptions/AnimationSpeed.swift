//
//  AnimationSpeed.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct AnimationSpeed: View {
    @State private var change: Bool = false
    let duration = 1.0
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Change") {
                change.toggle()
            }
            Text("Normal")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration), value: change)
            
            Text("2x Faster")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(2), value: change)
            
            Text("Half Slower")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(0.5), value: change)
            
        }
    }
}

struct AnimationSpeed_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSpeed()
    }
}
