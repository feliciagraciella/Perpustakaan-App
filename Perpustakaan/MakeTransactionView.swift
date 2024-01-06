//
//  MakeTransactionView.swift
//  cobasertif
//
//  Created by Felicia Graciella on 05/01/24.
//

import SwiftUI

enum Products: String, CaseIterable, Identifiable {
    case meja, kursi, rak, lampu
    var id: Self { self }
}

extension Products {
    var price: Int {
        switch self {
        case .meja: return 200000
        case .kursi: return 150000
        case .rak: return 100000
        case .lampu: return 50000
        }
    }
}

struct TransDetail: Identifiable {
    let pName: String
    let pQuantity: Int
    let subtotal: Float
    let id = UUID()
}


struct MakeTransactionView: View {
    @State var custName = ""
    @State var selectedProduct: Products = .meja
    
    @State var quantity = 0
    
    var subtotal: Int {
        return Int(quantity) * selectedProduct.price
    }
    
    @State var details: [TransDetail] = [
//        TransDetail(pName: "Meja", pQuantity: 2, subtotal: 400000),
//        TransDetail(pName: "Kursi", pQuantity: 1, subtotal: 150000),
//        TransDetail(pName: "Rak", pQuantity: 2, subtotal: 200000),
//        TransDetail(pName: "Lampu", pQuantity: 1, subtotal: 50000)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Transaction")
                .font(.largeTitle)
                .padding([.horizontal, .top])
            
            HStack {
                VStack {
                    HStack {
                        Text("Customer Name")
                        
                        TextField("Customer Name", text: $custName)
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Picker("Product", selection: $selectedProduct) {
                            Text("Meja").tag(Products.meja)
                            Text("Kursi").tag(Products.kursi)
                            Text("Rak").tag(Products.rak)
                            Text("Lampu").tag(Products.lampu)
                        }
                    
                    HStack {
                        Text("Quantity")
                        
//                        Stepper("\(quantity)", value: $quantity)
                        
                        TextField("Quantity", value: $quantity, format: .number)
                        
                        Button(action: {
                            let newDetail = TransDetail(pName: selectedProduct.rawValue.capitalized,
                                                        pQuantity: Int(quantity),
                                                        subtotal: Float(subtotal))
                            details.append(newDetail)
                            
                            quantity = 0
                            
                        }) {
                            Text("Add")
                        }
                            
                    }
                    
                    Table(details) {
                        TableColumn("Product", value: \.pName)
                        TableColumn("Quantity") { detail in
                                Text("\(detail.pQuantity)")
                            }
                        TableColumn("Subtotal") { detail in
                                Text("Rp.\(Int(detail.subtotal))")
                            }
                    }
                }
            }
            .padding()
        }
        
        
        
    }
}

#Preview {
    MakeTransactionView()
}
