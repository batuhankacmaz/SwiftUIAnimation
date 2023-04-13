//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 23.03.2023.
//

import SwiftUI

private enum Screens: String {
    case basicAnimations
    case animationTriggers
    case animationOptions
    case springAnimations
    case springAnimationsWithOptions
}

struct ContentView: View {
    @State private var navPath: [Screens] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ZStack {
                Color("Dark")
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        NavigationLink(destination: BasicAnimationExerciseView()) {
                            Text(Screens.basicAnimations.rawValue.capitalizedWithSpaces())
                        }
                        .modifier(LabelWithBanner())
                        NavigationLink(destination: TriggerImageWithContent()) {
                            Text(Screens.animationTriggers.rawValue.capitalizedWithSpaces())
                        }
                        .modifier(LabelWithBanner())
                        NavigationLink(destination: LoginWithLocked()) {
                            Text(Screens.animationOptions.rawValue.capitalizedWithSpaces())
                        }
                        .modifier(LabelWithBanner())
                        
                        NavigationLink(destination: InterpolatingSpringAnimation()) {
                            Text(Screens.springAnimations.rawValue.capitalizedWithSpaces())
                        }
                        .modifier(LabelWithBanner())
                        
                        NavigationLink(destination: SpringOptions()) {
                            Text(Screens.springAnimationsWithOptions.rawValue.capitalizedWithSpaces())
                        }
                        .modifier(LabelWithBanner())
                      
                    }
                    .padding()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                   
                        Text("Swift Animation")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            
        }
        
       
        
     
      
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LabelWithBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
            )
            .tint(Color("Dark"))
            .font(.title)
            .padding(.vertical, 8)
    }
}
