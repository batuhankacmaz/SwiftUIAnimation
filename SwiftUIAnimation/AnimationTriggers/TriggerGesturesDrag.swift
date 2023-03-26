//
//  TriggerGesturesDrag.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerGesturesDrag: View {
    @GestureState private var menuOffset = CGSize.zero
    @State private var currentMenuY: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            VStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                    .overlay(Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                        .offset(x: 0, y: -20))
                    .offset(x: 0, y: -50)
                
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 200)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
            .offset(x: 0, y: currentMenuY + menuOffset.height)
            .gesture(
            DragGesture()
                .updating($menuOffset, body: { value, menuOffset, transaction in
                    menuOffset = value.translation
                })
                .onEnded({ value in
                    if value.translation.height > 100 {
                        currentMenuY = 200
                    } else {
                        currentMenuY = 0
                    }
                })
            )
            .animation(.default, value: currentMenuY)
        }
        .font(.title)
        .ignoresSafeArea(.all)
    }
}

struct TriggerGesturesDrag_Previews: PreviewProvider {
    static var previews: some View {
        TriggerGesturesDrag()
    }
}
