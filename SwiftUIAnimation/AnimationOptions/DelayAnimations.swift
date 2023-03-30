//
//  DelayAnimations.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct DelaySequenceAnimations: View {
    @State private var show: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack {
                Group {
                    Image(systemName: "1.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.5), value: show)
                    Image(systemName: "2.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.9), value: show)
                    Image(systemName: "3.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(1.3), value: show)
                }.font(.system(size: 100))
                
                Button("Go",action: {})
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .padding(25)
                    .background(Circle().fill(Color.green))
                    .opacity(show ? 1 : 0)
                    .animation(.easeIn.delay(1.7), value: show)
            }.onAppear { show = true }
            Spacer()
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DelayAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wait 1.5 second after this loads before animating").padding(.horizontal)
            GeometryReader { gp in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }.font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .offset(x: change ? -gp.size.width / 2 : 0)
                        Rectangle()
                            .offset(x: change ? gp.size.width / 2 : 0)
                    }
                    .foregroundColor(.red)
                    .animation(.default.delay(1.5), value: change)
                }
            }
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            change = true
        }
    }
}

struct DelayAnimations_Previews: PreviewProvider {
    static var previews: some View {
        DelaySequenceAnimations()
    }
}
