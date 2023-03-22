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
        VStack {
            GeometryReader { geometry in
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    // .offset(x: change ? geometry.size.width - 100 : 0, y: change ? geometry.size.height - 100 : 0 )
                    .offset(x: (geometry.size.width - 100) / 2 , y: change ? geometry.size.height - 100: 0)
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
}

struct BasicAnimationExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationExerciseView()
    }
}
