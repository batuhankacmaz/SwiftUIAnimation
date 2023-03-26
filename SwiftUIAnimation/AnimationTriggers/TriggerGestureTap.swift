//
//  TriggerGestureTap.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerGestureTap: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Circle()
                .fill(isOn ? Color.green : Color.red)
                .frame(width: 200, height: 200)
                .overlay(Text("ON").opacity(isOn ? 1 : 0))
                .overlay(Text("OFF").foregroundColor(.white).opacity(isOn ? 0 : 1))
                .onTapGesture(count: 2, perform: {
                    isOn.toggle()
                })
                .shadow(color: isOn ? .green : .red, radius: 50)
                .animation(.default, value: isOn)
            
            Spacer()
            
        }.font(.title)
    }
}

struct TriggerGestureTap_Previews: PreviewProvider {
    static var previews: some View {
        TriggerGestureTap()
    }
}
