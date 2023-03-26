//
//  TriggerSlider.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 26.03.2023.
//

import SwiftUI

struct TriggerSlider: View {
    @State private var blueWidth: CGFloat = 50.0
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                Color.blue
                    .frame(width: blueWidth)
                Color.green
            }
            .animation(.default, value: blueWidth)
            
            Slider(value: $blueWidth, in: 0...410, step: 1)
                .padding()
        }
        .font(.title)
    }
}

struct TriggerSlider_Previews: PreviewProvider {
    static var previews: some View {
        TriggerSlider()
    }
}
