//
//  ScrollableToolbar.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct ScrollableToolbar: View {
    @State private var isExpand: Bool = false
    @State private var isVisible: Bool = false
   
    
    private let toolbarXOffset: CGFloat = 100
    private let duration: Double = 1
    private let delay: Double = 0.5
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Dark"), Color("Darkest")], center: .center, startRadius: 40, endRadius: 400)
            
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Dark"))
                    .frame(width: .infinity, height: 600)
                    .padding()
                GeometryReader { gp in
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(Color("Gold"))
                            .overlay(
                                HStack {
                                    Spacer()
                                    Group {
                                        Image(systemName: "pencil")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 4)
                                        Image(systemName: "scribble")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 4)
                                        Image(systemName: "lasso")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 4)
                                        Image(systemName: "scissors")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 4)
                                    }
                                    .opacity(isVisible ? 1 : 0)
                                
                                    Spacer()
                                    Spacer()
                                }
                                    
                            )
        
                            Circle()
                                .fill(Color("Gold"))
                                .overlay(
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white)
                                        .rotationEffect(Angle.degrees(270))
                                        .offset(x: 10)
                                )
                                .offset(x: -40)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: duration).speed(2)) {
                                        isExpand.toggle()
                                    }
                                    withAnimation(.easeOut(duration: duration).delay(delay)) {
                                        isVisible.toggle()
                                    }
                                }
                              
                                
                    }
                    .offset(x: isExpand ? 0 : -gp.size.width + 100)
                
                }
                .frame(height: 80)
            }
        }
        .ignoresSafeArea()
    }
}

struct ScrollableToolbar_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableToolbar()
    }
}


