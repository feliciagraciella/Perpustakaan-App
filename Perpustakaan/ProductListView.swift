//
//  ProductListView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @EnvironmentObject var appState: AppState
    @Binding var currentSubview: AnyView
    @Binding var showingSubview: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    ProductListView()
//}
