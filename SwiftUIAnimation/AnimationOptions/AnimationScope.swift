//
//  AnimationScope.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct AnimationScope: View {
    var body: some View {
        ScopeSequenceOnSingleView()
        ScopeParentAndChildren()
        ScopeChangeSizeInParent()
        ScopeDifferentAnimations()
    }
}

struct AnimationScope_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScope()
    }
}

struct ScopeSequenceOnSingleView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Change") {
                change.toggle()
            }
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 150))
            
            // First set of animated changes
                .scaleEffect(change ? 2 : 1)
                .animation(.easeInOut(duration: 1), value: change)
            
            // Second set of aniamted changes
                .scaleEffect(change ? 0.75 : 1)
                .animation(.easeIn.delay(1), value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

struct ScopeParentAndChildren: View {
    @State private var change: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Color.blue
                    .hueRotation(Angle.degrees(change ? 180 : 0))
                Color.green
                    .hueRotation(Angle.degrees(change ? 180 : 0))
                Color.red
                    .hueRotation(Angle.degrees(change ? 180 : 0))
            }
            .animation(.linear, value: change) //Applies animations everything within the HStack
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

struct ScopeChangeSizeInParent: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Color.yellow
                VStack {
                    Color.yellow.frame(minWidth: 20)
                    Color.green
                        .frame(width: change ? 200 : 100, height: change ? 250 : 100)
                    Color.yellow.frame(minHeight: 20)
                }
                Color.yellow
            }
            Color.yellow
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
        .animation(.default, value: change) // apply animation everything within it
    }
}

struct ScopeDifferentAnimations: View {
    @State private var change: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Change") {
                change.toggle()
            }
            
            Text("Uses Parent Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140)
            
            Text("Uses Own Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140)
                .animation(.easeIn, value: change)
                // .animation(.none, value: change) // No animation
        }
        .font(.title)
        .animation(.easeOut, value: change)
    }
}
