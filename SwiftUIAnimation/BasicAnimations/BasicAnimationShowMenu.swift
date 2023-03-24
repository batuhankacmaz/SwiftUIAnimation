//
//  BasicAnimationShowMenu.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 24.03.2023.
//

import SwiftUI

struct BasicAnimationShowMenu: View {
    @State var changing: Bool = false
    var body: some View {
        VStack {
            Button("Open Menu") {
                changing.toggle()
            }
            Spacer()
            MenuView()
                .offset(y: changing ? 0 : 300)
                .opacity(changing ? 1 : 0)
                .scaleEffect(changing ? 1 : 0.2,anchor: .bottom)
                .animation(.default, value: changing)
        }
    }
    
    @ViewBuilder
    func MenuView() -> some View {
        
        VStack(spacing: 20) {
            Image(systemName: "line.horizontal.3")
            Text("My Menu!")
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        .padding(.horizontal)
        .foregroundColor(.white)
        
        /// You can also use geometry reader for phone width but using .infinity also works

//        GeometryReader { geo in
//            RoundedRectangle(cornerRadius: 16)
//                .foregroundColor(.blue)
//                .frame(width: geo.size.width, height: 200)
//                .overlay {
//                    VStack {
//                        Image(systemName: "line.3.horizontal")
//                            .foregroundColor(.white)
//                            .font(.title2)
//                            .padding(.vertical, 16)
//                        Text("My Menu!")
//                            .font(.system(size: 15))
//                            .foregroundColor(.white)
//
//                        Spacer()
//                    }
//                }
//        }
//        .frame(width: .infinity, height: 200)
//        .padding()
    }
}

struct BasicAnimationShowMenu_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationShowMenu()
            
    }
}
