//
//  AnimationScopeWithAnimation.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct AnimationScopeWithAnimation: View {
    var body: some View {
        ScopeWithAnimationOnSingleView()
        ScopeWithAnimationMultipleViews()
        ScopeWithAnimationSequencing()
        ScopeWithAnimationSequencingSameView()
    }
}

struct AnimationScopeWithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScopeWithAnimation()
    }
}

struct ScopeWithAnimationOnSingleView: View {
    @State private var flipVertically: Bool = false
    @State private var flipHorizontally: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50) {
                Button {
                    withAnimation(.linear(duration: 0.6)) {
                        flipHorizontally.toggle()
                    }
                } label: {
                    Image(systemName: "flip.horizontal.fill").font(.system(size: 50)).padding()
                }
                
                Button {
                    withAnimation(.linear(duration: 0.6)) {
                        flipVertically.toggle()
                    }
                } label: {
                    Image(systemName: "flip.horizontal.fill").font(.system(size: 50))
                        .rotationEffect(.degrees(90)).padding()
                }
            }
            
            Image("day")
                .resizable()
                .padding(.horizontal)
                .scaleEffect(x: flipHorizontally ? -1 : 1,
                             y: flipVertically ? -1 : 1)
        }
        .font(.title)
    }
}

struct ScopeWithAnimationMultipleViews: View {
    @State private var unlock: Bool = false
    @State private var open: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                withAnimation {
                    unlock.toggle()
                }
            } label: {
                Image(systemName: unlock ? "lock.open" : "lock")
                    .offset(x: unlock ? 4.5 : 0)
                    .animation(.none, value: unlock)
            }
            
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }
                    .font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(unlock ? Color.green : Color.red)
                            .offset(x: open ? -geometry.size.width : 0)
                        Rectangle()
                            .fill(unlock ? Color.green : Color.red)
                            .offset(x: open ? geometry.size.width : 0)
                    }
                    
                    if unlock && open == false {
                        Button("O P E N") {
                            withAnimation(.easeOut(duration: 0.7)) {
                                open = true
                            }
                        }
                    }
                }
            }
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ScopeWithAnimationSequencing: View {
    @State private var show1: Bool = false
    @State private var show2: Bool = false
    @State private var show3: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Change") {
                withAnimation(.default) {
                    show1.toggle()
                }
                withAnimation(.default.delay(0.4)) {
                    show2.toggle()
                }
                withAnimation(.default.delay(0.8)) {
                    show3.toggle()
                }
            }
            Spacer()
            VStack(spacing: 20) {
                Image(systemName: "1.circle")
                    .opacity(show1 ? 1 : 0)
                Image(systemName: "2.circle")
                    .opacity(show2 ? 1 : 0)
                Image(systemName: "3.circle")
                    .opacity(show3 ? 1 : 0)
            }
            .font(.system(size: 80))
            Spacer()
        }.font(.title)
    }
}

struct ScopeWithAnimationSequencingSameView: View {
    @State private var expandMoreInfo: Bool = false
    @State private var showInfo: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
          
            GeometryReader { gp in
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle").padding(.horizontal)
                        Text("Login Help")
                        Spacer()
                    }.padding(.top)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "slider.horizontal.3").font(.largeTitle)
                        Text("Appear after parent is done animating out.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.1))
                    .padding(.horizontal)
                    .opacity(showInfo ? 1 : 0)
                }
                .padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow).shadow(radius: 8))
                .foregroundColor(.black)
                .offset(x: expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                        y: expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65))
                .onTapGesture {
                    withAnimation {
                        // Animation 1 on Parent
                        expandMoreInfo.toggle()
                    }
                    withAnimation(.default.delay(0.5)) {
                        // Animation 2 on Children
                        showInfo.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .font(.title)
    }
}
