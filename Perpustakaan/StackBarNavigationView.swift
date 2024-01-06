//
//  StackBarNavigationView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct StackBarNavigationView<RootContent>: View where RootContent: View {
    @Binding var currentSubview: AnyView
    @Binding var showingSubview: Bool
    
    let rootView: () -> RootContent
    
    init(currentSubview: Binding<AnyView>, showingSubview: Binding<Bool>,
         @ViewBuilder rootView: @escaping () -> RootContent) {
        self._currentSubview = currentSubview
        self._showingSubview = showingSubview
        self.rootView = rootView
    }
    
    var body: some View {
        VStack {
            if !showingSubview {
                rootView()
            } else {
                StackNavigationSubview(isVisible: $showingSubview) {
                    currentSubview
                }
                .transition(.move(edge: .trailing))
            }
        }
    }
}

private struct StackNavigationSubview<Content>: View where Content: View {
    @Binding var isVisible: Bool
    
    let contentView: () -> Content
    
    var body: some View {
        VStack {
            contentView() // subview
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isVisible = false
                    }
                }, label: {
                    Label("back", systemImage: "chevron.left")
                })
            }
        }
    }
}

