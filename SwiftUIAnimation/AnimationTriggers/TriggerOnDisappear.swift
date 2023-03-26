//
//  TriggerOnDisappear.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerOnDisappear: View {
    @State private var showTip: Bool = true
    @State private var showTipButton: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            if showTip {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Spacer()
                        Text("Tip of the Day")
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                    Button("Got It") {
                        showTip.toggle()
                    }
                }
                .padding()
                .background(Rectangle().fill(Color.green).shadow(radius: 3))
                .padding(.horizontal)
                .frame(height: 200)
                .onDisappear {
                    showTipButton = true
                }
            }
            
            if showTipButton {
                HStack {
                    Button(action: {
                        showTipButton = false
                        showTip = true
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .padding(.leading, 24)
                    Spacer()
                }
            }
        }
        .animation(.default, value: showTipButton)
        .font(.title)
    }
}

struct TriggerOnDisappear_Previews: PreviewProvider {
    static var previews: some View {
        TriggerOnDisappear()
    }
}
