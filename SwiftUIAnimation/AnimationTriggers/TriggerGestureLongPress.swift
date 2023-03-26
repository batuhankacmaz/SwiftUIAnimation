//
//  TriggerGestureLongPress.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerGestureLongPress: View {
    @State private var isLongPressed = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Circle()
                .fill(isLongPressed ? Color.blue : Color.green)
                .frame(width: 200, height: 200)
                .overlay(Text("Long Press"))
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 5)
                        .scaleEffect(isLongPressed ? 2 : 1)
                        .opacity(isLongPressed ? 0 : 1))
                .onLongPressGesture {
                    isLongPressed.toggle()
                }
                .animation(.default, value: isLongPressed)
            
            Spacer()
        }
        .font(.title)
    }
}

struct TriggerGestureLongPress_Previews: PreviewProvider {
    static var previews: some View {
        TriggerGestureLongPress()
    }
}
