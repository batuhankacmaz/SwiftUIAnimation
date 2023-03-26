//
//  TriggerScrollView.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerScrollView: View {
    var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                ZStack {
                    GeometryReader { gp in
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // By modifying the Y offset while scrolling you can change the scroll speed
                            .offset(y: -gp.frame(in: .global).origin.y / 2)
                    }
                    
                    VStack(spacing: 40) {
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                    }
                    .padding(40)
                }
                .ignoresSafeArea(edges: .vertical)
            }
        }
    }
}

struct TriggerScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TriggerScrollView()
    }
}
