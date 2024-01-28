//
//  ContentView.swift
//  animations
//
//  Created by Jigmet stanzin Dadul on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationValue = 1.0
    @State private var degree = 0.0
    @State private var color = Color(.black)
    var body: some View {
        VStack{
            
            Button("Tap me"){
                degree = 360.0
                color = .red
            }
            .padding(30)
            .background(color)
            .foregroundColor(.blue)
            .clipShape(.capsule)
            .rotation3DEffect(.degrees(degree), axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: degree)
            
            Button("Tap me"){
                
            }.padding(30)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(.capsule)
                .overlay(
                    Capsule()
                        .stroke(.red)
                        .scaleEffect(animationValue)
                        .opacity(1.5 - animationValue)
                        .animation(.easeInOut(duration: 2)
                            .repeatForever(autoreverses: false), value: animationValue)
                )
                .onAppear(perform: {
                    animationValue = 1.5
                })
        }
    }
}

#Preview {
    ContentView()
}
