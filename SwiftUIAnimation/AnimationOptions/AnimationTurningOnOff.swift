//
//  AnimationTurningOnOff.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct AnimationTurningOnOff: View {
    @State private var showCard: Bool = false
    @State private var useAnimation: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                showCard.toggle()
                useAnimation = true
            } label: {
                Image(systemName: "creditcard").font(.largeTitle)
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Get the Card")
                    Spacer()
                    Button {
                        useAnimation = false
                        showCard.toggle()
                    } label: {
                        Text("X").font(.body).padding(8)
                    }.background(Circle().stroke(Color.white))
                }.foregroundColor(.white)
                Image("Card")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
            .padding(.horizontal)
            .offset(x: showCard ? 0 : -400)
            .animation(useAnimation ? .default : .none, value: showCard)
        }.font(.title)
    }
}

struct AnimationTurningOnOff_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTurningOnOff()
    }
}
