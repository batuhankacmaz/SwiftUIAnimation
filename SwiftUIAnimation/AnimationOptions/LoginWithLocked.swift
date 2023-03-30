//
//  LoginWithLocked.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kaçmaz on 30.03.2023.
//

import SwiftUI

struct LoginWithLocked: View {
    @State private var showLogin = false
    @State private var userName: String = ""
    @State private var password: String = ""
    
    let xOffset: CGFloat = -200
    let duration: Double = 1
    let delay = 0.5
    var body: some View {
        ZStack {
            // Background
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
            
            VStack(spacing: 20) {
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(.easeIn(duration: duration/2).delay(delay), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: duration/2).delay(delay + 0.2), value: showLogin)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: duration/2).delay(delay + 0.4), value: showLogin)
                    Button("Login", action: { })
                        .foregroundColor(Color("Accent"))
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: duration/2).delay(delay + 0.6), value: showLogin)
                }
                .padding(.horizontal)
                .onAppear {
                    showLogin = true
                }
                Spacer()
                Spacer()
            }.font(.title)
        }
        .ignoresSafeArea()
    }
}

struct LoginWithLocked_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithLocked()
    }
}
