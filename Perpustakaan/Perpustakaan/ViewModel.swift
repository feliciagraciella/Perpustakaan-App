//
//  ViewModel.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var transactions = [TransactionModel]()
    @Published var detailTransactions: TransactionDetail?
    
    let prefix = "http://127.0.0.1:8000/api"
    
    init() {
        fetchTransaction()
    }
    
    func fetchTransaction() {
        guard let url = URL(string: "\(prefix)/transactions") else {
            print("URL not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
//                    print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.transactions = result.data
                    }
                } else {
                    print("no data")
                }
            } catch let JsonError {
                print("fetch json error:", JsonError)
            }
        }.resume()
    }
    
    func fetchDetailTransaction(transID: Int) {
        guard let url = URL(string: "\(prefix)/transactions/\(transID)") else {
            print("URL not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")
                    
                    let result = try JSONDecoder().decode(TransactionDetailResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.detailTransactions = result.data
                    }
                } else {
                    print("no data")
                }
            } catch let JsonError {
                print("fetch json error:", JsonError)
            }
        }.resume()
    }
    
    func fetchProducts() {
        guard let url = URL(string: "\(prefix)/products") else {
            print("URL not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")
                    
                    let result = try JSONDecoder().decode(TransactionDetailResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.detailTransactions = result.data
                    }
                } else {
                    print("no data")
                }
            } catch let JsonError {
                print("fetch json error:", JsonError)
            }
        }.resume()
    }
}
