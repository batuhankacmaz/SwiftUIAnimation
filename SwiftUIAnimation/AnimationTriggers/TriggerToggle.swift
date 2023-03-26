//
//  TriggerToggle.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerToggle: View {
    @State private var isOn: Bool = false
    @State private var extraInfo: String = ""
    @State private var extraAmount: Double = 0.65
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Extra Options", isOn: $isOn)
                .padding(.horizontal)
            Group {
                VStack(spacing: 20) {
                    Image(systemName: "hammer.fill")
                    Text("Your extra options!")
                    TextField("Extra Info", text: $extraInfo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Slider(value: $extraAmount)
                }
                .padding(28)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            }
            .padding(.horizontal)
            .saturation(isOn ? 1 : 0)
            .opacity(isOn ? 1 : 0.25)
            .animation(.default, value: isOn)
        }
        .font(.title)
    }
}

struct TriggerToggle_Previews: PreviewProvider {
    static var previews: some View {
        TriggerToggle()
    }
}
