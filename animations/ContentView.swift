//
//  ContentView.swift
//  animations
//
//  Created by Jigmet stanzin Dadul on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gradientCol = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(colors: [ gradientCol ? .purple : .green, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged({dragSize in
                        
                            dragAmount = dragSize.translation
                        
                       
                    })
                    .onEnded({ _ in
                        if(gradientCol){
                            gradientCol = false
                        }else{
                            gradientCol = true
                        }
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                       
                    })
            )
            .animation(.easeInOut.delay(1) , value: gradientCol)
            
    }
}

#Preview {
    ContentView()
}
