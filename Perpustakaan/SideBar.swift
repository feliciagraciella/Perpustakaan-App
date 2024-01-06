//
//  SideBar.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct SideBar: View {
    @EnvironmentObject private var appState: AppState
    
    @State var clickStatus: Bool = true
    @State var clickStatus2: Bool = false
    
    var body: some View {
        List {
            HStack{
                Image(systemName: "rectangle.on.rectangle.angled")
                    .frame(width: 12)
                Text("Transaction List")
            }
            .foregroundStyle(clickStatus ? .white : .primary)
            .listRowBackground(clickStatus ? Color.black.clipShape(RoundedRectangle(cornerRadius: 6)).padding(.horizontal, 10) : Color.clear.clipShape(RoundedRectangle(cornerRadius: 6)).padding(.horizontal))
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.3)) {
                    appState.routes.removeAll()
                    appState.push(.transaction)
                    clickStatus = true
                    clickStatus2 = false
                }
            }
            
            HStack{
                Image(systemName: "trash")
                    .frame(width: 12)
                Text("Product List")
            }
            .foregroundStyle(clickStatus2 ? .white : .primary)
            .listRowBackground(clickStatus2 ? Color.black.clipShape(RoundedRectangle(cornerRadius: 6)).padding(.horizontal, 10) : Color.clear.clipShape(RoundedRectangle(cornerRadius: 6)).padding(.horizontal))
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.3)) {
                    appState.routes.removeAll()
                    appState.push(.product)
                    clickStatus = false
                    clickStatus2 = true
                }
                
            }
            
        }
    }
}

#Preview {
    SideBar()
}
