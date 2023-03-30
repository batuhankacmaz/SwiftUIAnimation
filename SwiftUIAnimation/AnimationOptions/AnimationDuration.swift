//
//  AnimationDuration.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct DurationLongExample: View {
    @State private var change: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image(systemName: "cloud.sun.fill")
                    .modifier(Weather(backgroundColor: Color.yellow))
                    .offset(x: change ? 240 : -240, y: 20)
                    .animation(.linear(duration: 15), value: change)
                
                Image(systemName: "cloud.fill")
                    .modifier(Weather(backgroundColor: Color.gray))
                    .offset(x: change ? -240 : 240, y: 200)
                    .animation(.linear(duration: 15), value: change)
            }
            Spacer()
            Button("Change") {
                change.toggle()
            }
        }
    }
}

struct AnimationDuration: View {
    @State private var change: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            
            LabelWithAnimal(label: "Duraion: Default", animal: "hare.fill")
            
            LabelWithAnimal(label: "Duration: 2 Seconds", animal: "tortoise.fill", duration: 2.0)
            
            Button("Change") {
                change.toggle()
            }
                
            
        }
    }
    
    @ViewBuilder
    func LabelWithAnimal(label: String, animal: String, duration: Double = 0.4) -> some View {
        VStack {
            Text(label)
            Image(systemName: animal)
                .foregroundColor(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150)
                .font(.title)
                .animation(.easeOut(duration: duration), value: change) // default animation duration is approx 0.4
            
        }
    }
}



struct AnimationDuration_Previews: PreviewProvider {
    static var previews: some View {
        DurationLongExample()
    }
}

struct Weather: ViewModifier {
    var backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 200))
            .foregroundColor(backgroundColor)
            .opacity(0.3)
    }
}
