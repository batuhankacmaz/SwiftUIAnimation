//
//  BasicAnimationExerciseView.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 23.03.2023.
//

import SwiftUI

struct BasicAnimationExerciseView: View {
    @State private var change: Bool = false
    var body: some View {
        FourRectangleAnimation()
    }
    
    @ViewBuilder
    func CircleWithAnimation() -> some View {
        VStack {
            GeometryReader { geometry in
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    // .offset(x: change ? geometry.size.width - 100 : 0, y: change ? geometry.size.height - 100 : 0 )
                    .offset(x: (geometry.size.width - 100) / 2 , y: change ? geometry.size.height - 100: 0)
                    // .offset(change ? CGSize(width: (geometry.size.width - 100) / 2, height: geometry.size.height - 100) : CGSize(width: (geometry.size.width - 100) / 2, height: 0))
                    .animation(Animation.easeInOut, value: change)
            }
            .padding()
            Spacer()
            Button("Change") {
                change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
    
    @ViewBuilder
    func FourRectangleAnimation() -> some View {
        let offsetValue: CGFloat = 200
        
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -offsetValue)
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -offsetValue)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : offsetValue)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : offsetValue)
                }.offset(x: 18)
                
                
            } //: VSTACK
            .rotationEffect(.degrees(change ? -90 : 0))
            .foregroundColor(change ? .red : .orange)
            .opacity(change ? 1 : 0)
            .animation(.default, value: change)
                
            Spacer()
            
            Button("Change") {
                change.toggle()
            }.padding(.bottom)
            
        } //: VSTACK
        .font(.title)
       
    }
        
}

struct BasicAnimationExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationExerciseView()
    }
}
