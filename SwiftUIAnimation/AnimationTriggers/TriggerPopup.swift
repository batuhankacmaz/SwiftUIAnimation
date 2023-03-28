//
//  TriggerPopup.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerPopup: View {
    @State private var showPopup: Bool = true
    @GestureState private var popupOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                Button("Show Popup") {
                    showPopup = true
                }.font(.title)
            }
            .blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut, value: showPopup)
            
            // The popup
            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture { showPopup = false }
                    
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside if the popup to close")
                        Spacer()
                        Button("Or Tap This Button to Close") {
                            // Dismiss popup
                            showPopup = false
                        }
                        .padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100)
                            .updating($popupOffset, body: { value, popupOffset, transaction in
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                               showPopup = false
                            })
                    )
                }
                .animation(.default, value: showPopup)
            }
        
        }
        .animation(.easeIn, value: showPopup)
    }
}

struct TriggerPopup_Previews: PreviewProvider {
    static var previews: some View {
        TriggerPopup()
    }
}
