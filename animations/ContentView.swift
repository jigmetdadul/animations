//
//  ContentView.swift
//  animations
//
//  Created by Jigmet stanzin Dadul on 28/01/24.
//

import SwiftUI


struct cornerRotateModifier: ViewModifier{
    let amount:Double
    let anchor:UnitPoint
    
    func body(content: Content) -> some View {
         content
            .rotationEffect(.degrees(amount), anchor: anchor)
             
    }
}

extension AnyTransition{
    static var pivot: AnyTransition{
        .modifier(active: cornerRotateModifier(amount: -90, anchor: .topLeading), identity: cornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}
struct ContentView: View {
    @State private var gradientCol = false
    @State private var dragAmount = CGSize.zero
    @State private var viewToggle = false
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
            
        Button("Present new view"){
            withAnimation {
                viewToggle.toggle()
            }
        }
        .buttonBorderShape(.capsule).buttonStyle(.borderedProminent).tint(.green)
        
        if viewToggle{
            Rectangle()
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 20))
                .transition(.pivot)
        }
        
    }
}

#Preview {
    ContentView()
}
