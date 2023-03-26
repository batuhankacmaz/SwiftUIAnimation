//
//  TriggerGestureRotation.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerGestureRotation: View {
    @State private var degrees: CGFloat = 0.0
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Group {
                Image(systemName: "gear")
                    .font(.system(size: 300))
                    .rotationEffect(Angle.degrees(degrees))
                    .gesture(RotationGesture()
                        .onChanged({ angle in
                            degrees = angle.degrees
                        }))
                    .animation(.default, value: degrees)
                
                Image(systemName: "gear")
                    .font(.system(size: 140))
                    .rotationEffect(-Angle.degrees(degrees))
                    .offset(x: 130, y: -100)
                    .animation(.default, value: degrees)
                
                Image(systemName: "gear")
                    .font(.system(size: 80))
                    .rotationEffect(Angle.degrees(degrees))
                    .offset(x: 60, y: -160)
                    .animation(.default, value: degrees)
            }
            .foregroundColor(.green)
            
            Spacer()
        }
    }
}

struct TriggerGestureRotation_Previews: PreviewProvider {
    static var previews: some View {
        TriggerGestureRotation()
    }
}
