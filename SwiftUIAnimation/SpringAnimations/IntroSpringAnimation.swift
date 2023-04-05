//
//  IntroSpringAnimation.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 5.04.2023.
//

import SwiftUI

struct IntroSpringAnimation: View {
    @State private var show: Bool = false
    @State private var dampingFraction = 0.825 // This is the default damping fraction
    @State private var response = 0.55 // This is the default response value == closer thing duration for the animation
    @State private var blendDuration = 1.0 // you should research more about that
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(response: response, dampingFraction: dampingFraction, blendDuration: blendDuration), value: show)
                
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }.tint(Color("Accent"))
                
                SliderWithLabel(title: "Damping", value: $dampingFraction, range: 0...1)
                SliderWithLabel(title: "Response", value: $response, range: 0...4)
                SliderWithLabel(title: "Blend", value: $response, range: 0...2)

                
                
            }
            .font(.title)
        }
    }
    
    @ViewBuilder
    func SliderWithLabel(title: String, value: Binding<Double>, range: ClosedRange<Double>) -> some View {
        VStack {
            Text(title).font(.title3)
            HStack {
                Image(systemName: "0.circle.fill")
                Slider(value: value, in: range)
                Image(systemName: "1.circle.fill")
            }
        }
        .foregroundColor(Color("Gold")).padding()
    }
}

struct IntroSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        IntroSpringAnimation()
    }
}
