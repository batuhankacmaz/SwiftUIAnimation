//
//  TriggerOnAppear.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerOnAppear: View {
    @State private var expand: Bool = false
    var body: some View {
        ZStack {
            Image(systemName: "sun.max.fill")
                .padding()
                .foregroundColor(.white)
                .background(Circle()
                    .fill(Color.green)
                    .scaleEffect(expand ? 20 : 1)
                    .ignoresSafeArea())
                .onAppear { expand.toggle() }
                .animation(.easeIn, value: expand)
        }
    }
}

struct TriggerOnAppear_Previews: PreviewProvider {
    static var previews: some View {
        TriggerOnAppear()
    }
}
