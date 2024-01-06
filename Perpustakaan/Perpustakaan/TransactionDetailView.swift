//
//  TransactionDetailView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI

struct TransactionDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    var transID: Int
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.detailTransactions?.details ?? [], id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(item.product_name)")
                                .font(.title)
                            
                            Text("\(item.quantity) pcs")
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Subtotal")
                                .font(.headline)
                            Text("Rp.\(item.subtotal)")
                        }
                        
                    }
                }
            }
            
            HStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Total")
                        .font(.headline)
                    Text("\(viewModel.detailTransactions?.total ?? 0)")
                        
                }
            }
            .padding()
            
            
        }
        .padding()
        .onAppear {
            viewModel.fetchDetailTransaction(transID: transID)
        }
//        Text("\(transID)")
    }
}

#Preview {
    TransactionDetailView(transID: 1)
}
