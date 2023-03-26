//
//  TriggerStepper.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 26.03.2023.
//

import SwiftUI

struct TriggerStepper: View {
    @State private var stepperValue: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
        
            ZStack {
                ForEach(0...60, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.green).opacity(0.2)
                        .frame(width: .random(in: 10...150),
                               height: .random(in: 10...150))
                        .position(x: .random(in: stepperValue...400),
                                  y: .random(in: stepperValue...600))
                        .animation(.default, value: stepperValue)
                }
            }
            
            Stepper("Adjust", value: $stepperValue, in: 1.0...5.0)
                .padding()
        }
        .font(.title)
    }
}

struct TriggerStepper_Previews: PreviewProvider {
    static var previews: some View {
        TriggerStepper()
    }
}
