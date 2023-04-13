//
//  SpringOptions.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 6.04.2023.
//

import SwiftUI

private enum Page {
    case first
    case second
    case third
}

struct SpringOptions: View {
    @State private var page: Page = .first
    @State private var show: Bool = false
    @State private var largeScale: CGFloat = 5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack {
                    Button("First") {
                        page = .first
                    }
                    Button("Second") {
                        page = .second
                    }
                    Button("Third") {
                        page = .third
                    }
                }
                .foregroundColor(Color("Gold"))
                .font(.title)
                VStack(spacing: 40) {
                    Button("Start") {
                        show.toggle()
                    }
                    .font(.title)
                    .tint(Color("Accent"))
                    
                    switch page {
                    case .first:
                        FirstScreen()
                    case .second:
                        SecondScreenView(change: $show)
                    case .third:
                        ThirdScreenView(change: $show)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func FirstScreen() -> some View {
        Spacer()
        HStack(spacing: 30) {
            Group {
                BigCircle(circleName: "1.circle", duration: 0)
                BigCircle(circleName: "2.circle", duration: 0.3)
                BigCircle(circleName: "3.circle", duration: 0.6)
            }
            .foregroundColor(Color("Gold"))
            .font(.system(size: 100))
        }
        Spacer()
        
    }
    
    @ViewBuilder
    func BigCircle(circleName: String, duration: Double) -> some View {
        Image(systemName: circleName)
            .opacity(show ? 1 : 0)
            .scaleEffect(show ? 1 : largeScale)
            .animation(.interpolatingSpring(stiffness: 59, damping: 4).delay(duration), value: show)
        //            .animation(.spring(response: 0.4, dampingFraction: 0.5).delay(duration), value: show)
    }
}

struct SpringOptions_Previews: PreviewProvider {
    static var previews: some View {
        SpringOptions()
    }
}

struct SecondScreenView: View {
    @Binding var change: Bool
    
    var body: some View {
        Group {
            Text("No speed modifier")
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.spring(response: 2, dampingFraction: 0.6)
                    .repeatCount(2, autoreverses: false), value: change)
            Text("2x Faster")
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.spring(response: 2, dampingFraction: 0.6)
                    .speed(2), value: change)
            Text("Half Slower")
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.spring(response: 2, dampingFraction: 0.6)
                    .speed(0.5), value: change)
        }
        .foregroundColor(Color("Gold"))
        .font(.title)
        
    }
 
}

struct ThirdScreenView: View {
    @Binding var change: Bool
    
    var body: some View {
        Group {
            Text("Using dampingFraction = 0")
            Text("(spring animation)")
                .foregroundColor(.white)
                .font(.caption)
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 20 : -20)
                .animation(.spring(response: 1, dampingFraction: 0), value: change) // GOING TO FOREVER ANIMATION
            Text("Using dampingFraction = 0")
            Text("(interpolatingSpring animation)")
                .foregroundColor(.white)
                .font(.caption)
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 20 : -20)
                .animation(.interpolatingSpring(stiffness: 40, damping: 0), value: change)
            Text("Repeat 3 times")
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 40 : -40)
                .animation(.spring(response: 0.5, dampingFraction: 0.5)
                    .repeatCount(3, autoreverses: false), value: change)
            Text("Repeat Forever")
            Circle()
                .fill(Color("Gold"))
                .frame(height: 70)
                .offset(x: change ? 40 : -40)
                .animation(.spring(response: 0.5, dampingFraction: 0.5)
                    .repeatForever(autoreverses: false), value: change)
        }
        .foregroundColor(Color("Gold"))
        .font(.title)
        
    }
 
}
