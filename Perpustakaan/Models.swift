//
//  Models.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import Foundation
import SwiftUI


//MARK: - Transaction List
struct DataModel: Decodable {
    let data: [TransactionModel]
}

struct TransactionModel: Decodable, Identifiable {
    let id: Int
    let customerFName: String
    let customerLName: String
    let total: Float
    let date: String
}

//MARK: - Transaction Detail
struct TransactionDetailResponse: Codable {
    let data: TransactionDetail
}

struct TransactionDetail: Codable {
    let id: Int
    let total: Int
    let customer: Customer
    let details: [Detail]
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, total, customer, details
        case createdAt = "created_at"
    }
}

struct Customer: Codable {
    let id: Int
    let firstName, lastName: String
}

struct Detail: Codable {
    let id, transactionID: Int
    let product_name: String
    let quantity, subtotal: Int

    enum CodingKeys: String, CodingKey {
        case id, transactionID, product_name, quantity, subtotal
    }
}

//MARK: - Product List
struct Product: Codable {
    
}

