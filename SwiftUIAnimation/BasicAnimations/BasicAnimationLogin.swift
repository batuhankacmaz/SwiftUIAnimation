//
//  BasicAnimation_Login.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 23.03.2023.
//

import SwiftUI

struct BasicAnimationLogin: View {
    @State var changing: Bool = false
    @State var usernameText: String = ""
    @State var passwordText: String = ""
    var body: some View {
        
        ZStack {
            
            Color.gray.opacity(0.05).ignoresSafeArea(.all)
            
            VStack(spacing: 1) {
                Text("Already have an account?")
                    .font(.system(size: 20, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .tracking(2)
                
                Button("Login Now") {
                    changing.toggle()
                }
                .font(.headline)
                .padding(.vertical)
                
                
                VStack {
                    Image(systemName: "lock.shield")
                        .font(.title)
                    TextField("Username", text: $usernameText)
                        .modifier(LoginTextFieldStyle())
                    TextField("Password", text: $passwordText)
                        .modifier(LoginTextFieldStyle())
                }
                .offset(x: changing ? 0 : -400)
                .animation(.default, value: changing)
            }
        }
        
    }
}

struct BasicAnimation_Login_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationLogin()
    }
}


struct LoginTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8.0)
            .background(Color.white.cornerRadius(8.0))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .font(.system(size: 20))
            .padding(.horizontal)
            .padding(.vertical, 6)
            
    }
}
