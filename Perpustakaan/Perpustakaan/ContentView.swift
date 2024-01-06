//
//  ContentView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @EnvironmentObject private var appState: AppState
    @State private var currentSubview = AnyView(DummyView())
    @State private var showingSubview = false
    
    var body: some View {
        NavigationSplitView{
            SideBar()
                .onChange(of: appState.currentRoute) { oldValue, newValue in
                    showingSubview = false
                }
        } detail: {
            StackBarNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview){
                if let currentRoute = appState.currentRoute {
                    switch currentRoute {
                    case .transaction:
                        TransactionListView(currentSubview: $currentSubview, showingSubview: $showingSubview)
                            .environmentObject(viewModel)

                    case .product:
                        ProductListView(currentSubview: $currentSubview, showingSubview: $showingSubview)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
