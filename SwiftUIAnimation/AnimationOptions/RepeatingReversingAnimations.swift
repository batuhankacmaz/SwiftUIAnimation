//
//  RepeatingReversingAnimations.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct RepeatingReversingAnimations: View {
    @State private var start: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Button("Start", action: { start.toggle() })
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1)
                )
                // .animation(.easeOut(duration: 0.6).repeatCount(3, autoreverses: false), value: start) // if you dont make autoreverses false then repeating like 0 to 1 and 0 to 0. If you make disabled then repeating count that desired and 0 to 1 only
                .animation(.easeOut(duration: 0.6)
                    .delay(1) // you can also make delat every animation between
                           // just add delay before to repeatforever or repeatcount
                    .repeatForever(autoreverses: false), value: start) // if you dont write parametter then autoreverse true you can customize auto reverse
            Spacer()
        }
        .font(.title)
    }
}

struct RepeatingReversingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        RepeatingReversingAnimations()
    }
}
