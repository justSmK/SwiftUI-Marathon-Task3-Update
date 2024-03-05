//
//  ContentView.swift
//  SwiftUIMarathonTask3
//
//  Created by Sergei Semko on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimated = false
    private let width: CGFloat = 100
    private let minOpacity: CGFloat = 0.5
    
    var body: some View {
        Button(action: {
            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10), completionCriteria: .logicallyComplete) {
                isAnimated = true
            } completion: {
                isAnimated = false
            }
        }, label: {
            HStack(spacing: 0, content: {
                ImageContentView()
                    .frame(width: isAnimated ? width : 1)
                    .opacity(isAnimated ? 1 : minOpacity)
                    .scaleEffect(isAnimated ? 1 : 0)
                
                ImageContentView()
                    .frame(width: width)
                
                ImageContentView()
                    .frame(width: isAnimated ? 1 : width)
                    .opacity(isAnimated ? minOpacity : 1)
                    .scaleEffect(isAnimated ? 0 : 1)
            })
        })
    }
}

struct ImageContentView: View {
    var body: some View {
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ContentView()
}
