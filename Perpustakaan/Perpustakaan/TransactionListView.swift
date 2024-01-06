//
//  TransactionListView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct TransactionListView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @EnvironmentObject var appState: AppState
    @Binding var currentSubview: AnyView
    @Binding var showingSubview: Bool
    
    @State var transID = 0
    @State var total = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Transaction List")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button {
                        currentSubview = AnyView(MakeTransactionView())
                        showingSubview = true
                    } label: {
                        Text("New Transaction")
                    }
                        
                }
                .padding([.horizontal, .top])
                
                
                List {
                    if viewModel.transactions.isEmpty {
                        Text("no data")
                    } else {
                        ForEach(viewModel.transactions, id: \.id) { item in
                            NavigationLink(
                                destination: TransactionDetailView(transID: item.id),
                                label: {
                                    HStack {
                                        Text("\(item.id)")
                                            .frame(width: 20)
                                        
                                        VStack(alignment: .leading) {
                                            Text("\(item.customerFName) \(item.customerLName)")
                                            Text("\(item.date)")
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Text("Rp.\(Int(item.total))")
                                        }
                                        .frame(width: 100)
                                        
                                    }
                                    
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    TransactionListView()
//        .environmentObject(ViewModel())
//}
