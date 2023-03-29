//
//  TriggerImageWithContent.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 27.03.2023.
//

import SwiftUI

struct TriggerImageWithContent: View {
    @State private var expandImage: Bool = false
    @GestureState private var textViewOffset: CGSize = CGSize.zero
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Kluane National Park")
                .font(.system(size: 24, weight: .bold))
            
            // 250 600
            Image("KluaneNationalPark")
                .resizable()
                .aspectRatio(contentMode: expandImage ? .fill : .fit)
                .frame(height: expandImage ? 500 : 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .animation(.default, value: expandImage)
            
            
            VStack {
                Button(action: { expandImage.toggle() }) {
                    Image(systemName: "chevron.down")
                        .font(.title)
                        .padding(.bottom, 8)
                        .rotationEffect(Angle(degrees: expandImage ? -180 : 0))
                    
                }
                
                Text("Kluane National Park and Reserve is in the southwest of the Yukon, in Canada. It’s a vast wilderness of ice fields, forests and towering peaks like Mount Logan. Trails include the King’s Throne, which winds above Kathleen Lake to a dramatic view. The Alsek River travels through areas inhabited by grizzly bears.")
                    .font(.title)
                    .padding(.horizontal, 10)
            }
            .offset(textViewOffset)
            .gesture(DragGesture()
                .updating($textViewOffset, body: { value, textViewOffset, transaction in
                    
                    
                    textViewOffset.height = value.translation.height
                    
                    
                })
                    .onEnded({ value in
                       
                        if value.translation.height < -100 {
                            expandImage = false
                        }
                        
                        if value.translation.height > 100 {
                            expandImage = true
                        }
                    })
            )
            .animation(.default, value: expandImage)
        }
    }
}

struct TriggerImageWithContent_Previews: PreviewProvider {
    static var previews: some View {
        TriggerImageWithContent()
    }
}
