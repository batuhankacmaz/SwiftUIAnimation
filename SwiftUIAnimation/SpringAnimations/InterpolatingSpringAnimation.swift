//
//  InterpolatingSpringAnimation.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 5.04.2023.
//

import SwiftUI

private enum Page {
    case first
    case second
    case third
}

struct InterpolatingSpringAnimation: View {
    @State private var page: Page = .first
    @State private var change = false
    @State private var show = false
    /// first get the speed you want -> stifness then adjust the damping to get the extent of the bounce  you  want
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Dark"), Color("Darkest")], center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
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
                
                switch page {
                case .first:
                    VStack(spacing: 10) {
                        Spacer()
                        Button("Compare") {
                            change.toggle()
                        }
        //                HStack(alignment: .bottom, spacing: 30) {
        //                    LabelWithBarStifness(value: 0.7)
        //                    LabelWithBarStifness(value: 1)
        //                    LabelWithBarStifness(value: 10)
        //                    LabelWithBarStifness(value: 50)
        //                    LabelWithBarStifness(value: 100)
        //                    LabelWithBarStifness(value: 200)
        //                }

        //                HStack(alignment: .bottom, spacing: 30) {
        //                    LabelWithBarDamping(value: 0)
        //                    LabelWithBarDamping(value: 0.5)
        //                    LabelWithBarDamping(value: 1)
        //                    LabelWithBarDamping(value: 3)
        //                    LabelWithBarDamping(value: 5)
        //                }

        //                HStack(alignment: .bottom, spacing: 30) {
        //                    LabelWithBarMass(value: 0.01)
        //                    LabelWithBarMass(value: 0.5)
        //                    LabelWithBarMass(value: 1)
        //                    LabelWithBarMass(value: 10)
        //                    LabelWithBarMass(value: 100)
        //                }
                        
                        HStack(alignment: .bottom, spacing: 30) {
                            LabelWithBarInitialVelocity(value: 0)
                            LabelWithBarInitialVelocity(value: 5)
                            LabelWithBarInitialVelocity(value: 10)
                            LabelWithBarInitialVelocity(value: 50)
                            LabelWithBarInitialVelocity(value: 100)
                        }
                    }
                    .foregroundColor(.white)
                .font(.system(size: 24))
                case .second:
                    NegativeInitialVelocity(show: $show)
                case .third:
                    InterpolatingOverlapping()
                }
             
             
            }
        }
    }
    
    @ViewBuilder
    func LabelWithBarStifness(value: Double) -> some View {
        let title = value >= 1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
        VStack {
            Text(title).bold()
            Spacer()
            Rectangle()
                .fill(Color("Gold"))
                .frame(width: 20, height: change ? 400 : 25)
                .animation(.interpolatingSpring(stiffness: value, damping: 1), value: change)
            ///  speed
        }
    }
    
    @ViewBuilder
    func LabelWithBarDamping(value: Double) -> some View {
        let title = value >= 1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
        VStack {
            Text(title).bold()
            Spacer()
            Rectangle()
                .fill(Color("Gold"))
                .frame(width: 20, height: change ? 400 : 25)
                .animation(.interpolatingSpring(stiffness: 10, damping: value), value: change)
            ///  extent bounce
        }
    }
    
    @ViewBuilder
    func LabelWithBarMass(value: Double) -> some View {
        let title = value >= 1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
        VStack {
            Text(title).bold()
            Spacer()
            Rectangle()
                .fill(Color("Gold"))
                .frame(width: 20, height: change ? 400 : 25)
                .animation(.interpolatingSpring(mass: value, stiffness: 50, damping: 7), value: change)
            
            ///  if mass is increases then animation duration get long
        }
    }
    
    @ViewBuilder
    func LabelWithBarInitialVelocity(value: Double) -> some View {
        let title = value >= 1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
        VStack {
            Text(title).bold()
            Spacer()
            Rectangle()
                .fill(Color("Gold"))
                .frame(width: 20, height: change ? 400 : 25)
                .animation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 7, initialVelocity: value), value: change)
        }
    }
}

struct InterpolatingSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringAnimation()
    }
}

// MARK: Negative Initial Velocity

struct NegativeInitialVelocity: View {
    @Binding var show: Bool
    var body: some View  {
        VStack(spacing: 20) {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("Gold"))
                    .shadow(radius: 10)
                    .overlay(
                        VStack {
                            Text("Make Bigger!")
                            Image("woman.arms.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        })
                    .aspectRatio(CGSize(width: 1, height: 1.5), contentMode: .fit)
                    .padding()
                    .scaleEffect(show ? 2  : 1, anchor: .leading)
                    .zIndex(1)
                    .animation(.interpolatingSpring(stiffness: 100, damping: 10, initialVelocity: -10), value: show)
                    .onTapGesture { show.toggle() }
                
                Text("Notioce the rectangle gets smaller first before it gets bigger.")
            }
            .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct InterpolatingOverlapping: View {
    @State private var degrees = 0.0
    @State private var taps = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color("Gold"))
                .frame(width: 300, height: 300)
                .overlay(Image(systemName: "arrow.up").offset(y: -120))
                .rotationEffect(.degrees(degrees))
                .animation(.interpolatingSpring(stiffness: 1, damping: 0.8), value: degrees)
                .onTapGesture {
                    degrees += 25
                    taps += 1
                }
                
            Text("Taps: \(taps)")
                .foregroundColor(Color("Gold"))
        }
        .font(.title)
    }
}
