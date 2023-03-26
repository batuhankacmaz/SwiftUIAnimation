//
//  TriggerButton.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 26.03.2023.
//

import SwiftUI

struct TriggerButton: View {
    @State var showButtons: Bool = true
    
    var body: some View {
     
        ZStack(alignment: .bottomTrailing) {
                Group {
                    Spacer()
                    Button(action: { showButtons.toggle() }) {
                        Image(systemName: "bag.badge.plus")
                            .padding(24)
                            .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
                            .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                            .opacity(showButtons ? 1 : 0)
                            .offset(x: 0, y: showButtons ? -150 : 0) // No
                    }
                    
                    Button(action: { showButtons.toggle() }) {
                        Image(systemName: "gauge.badge.plus")
                            .padding(24)
                            .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                    }
                    .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                    .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                    .opacity(showButtons ? 1 : 0)
                    
                    Button(action: { showButtons.toggle() }) {
                        Image(systemName: "calendar.badge.plus")
                            .padding(24)
                            .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                    }
                    .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                    .offset(x: showButtons ? -150 : 0, y: 0)
                    .opacity(showButtons ? 1 : 0)
                    
                    Button(action: { showButtons.toggle() }) {
                        Image(systemName: "plus")
                            .padding(24)
                            .rotationEffect(Angle.degrees(showButtons ? 45 : 0))
                    }
                    .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                }
                .padding(.trailing, 20)
                .tint(.white)
                .animation(.default, value: showButtons)
            }
            .font(.title)
        
    }
}

struct TriggerButton_Previews: PreviewProvider {
    static var previews: some View {
        TriggerButton()
    }
}
