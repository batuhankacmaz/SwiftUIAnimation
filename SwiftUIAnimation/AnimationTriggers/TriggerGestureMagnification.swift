//
//  TriggerGestureMagnification.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerGestureMagnification: View {
    @GestureState private var scale: CGFloat = 0.0
    @State private var endScale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("castle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .gesture(MagnificationGesture()
                    .updating($scale, body: { value, scale, transaction in
                        scale = value.magnitude
                    })
                        .onEnded({ value in
                            endScale = value.magnitude + endScale
                        })
                )
                .animation(.default, value: endScale)
            
            Spacer()
        }
    }
}

struct TriggerGestureMagnification_Previews: PreviewProvider {
    static var previews: some View {
        TriggerGestureMagnification()
    }
}
