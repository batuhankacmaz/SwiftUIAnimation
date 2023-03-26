//
//  TriggerSegmentedControl.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 26.03.2023.
//

import SwiftUI

struct TriggerSegmentedControl: View {
    @State private var segment = 0
    var body: some View {
        VStack(spacing: 20) {
            Picker("Day & Night", selection: $segment) {
                Text("Day ☀️").tag(0)
                Text("Night 🌙").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            
            GeometryReader { gp in
                ZStack {
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Image(systemName: "sun.max.fill").font(.system(size: 50))
                            Spacer()
                        }.padding(.top, 24)
                        Text("The Day Report")
                        Spacer()
                    }
                    .background(Image("day").resizable().aspectRatio(contentMode: ContentMode.fill)
                    )
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .offset(x: segment == 0 ? 0 : -gp.size.width, y: 0)
                    .animation(.default, value: segment)
                    
                    VStack(spacing: 20) {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "moon.fill").font(.system(size: 50))
                            Spacer()
                        }
                        Text("The Night Report")
                            .padding(.bottom, 24)
                    }
                    .background(Image("night")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill))
                    .cornerRadius(20)
                    .foregroundColor(.orange)
                    .offset(x: segment == 1 ? 0 : gp.size.width, y: 0)
                    .animation(.default, value: segment)
                }
                .shadow(radius: 15)
                .padding(.horizontal)
            }
        }.font(.title)
    }
}

struct TriggerSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        TriggerSegmentedControl()
    }
}
