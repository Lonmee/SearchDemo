//
//  Goods.swift
//  SearchDemo
//
//  Created by Lonmee on 8/14/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation

struct Goods : Hashable, Codable, Identifiable {
    var id: Int
    var brand: String
    var category: Category
    var mode: String
    var stock: Bool
    var price: Double
    
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case vacuum = "Vacuum"
        case hairDryer = "Hair Dryer"
        case xxx = "XXX"
        case ooo = "OOO"
    }
}

/******************* dev only *******************/
/// mock data
let goodsData: [Goods] = [
    Goods(id: 0, brand: "Dyson", category: .vacuum, mode: "V11", stock: true, price: 599.99),
    Goods(id: 1, brand: "Dyson", category: .vacuum, mode: "V10", stock: false, price: 399.99),
    Goods(id: 2, brand: "Dyson", category: .hairDryer, mode: "Supersonic", stock: true, price: 399.99)
]

let goodsDataEmpty: [Goods] = []

/// mock data deserializing for server
/// - Returns: data for server side
func deserialize() -> String {
    do {
        let data = try JSONEncoder().encode(goodsData)
        return String(data: data, encoding: .utf8)!
    } catch {
        fatalError("Couldn't decode mock data:\n\(error)")
    }
}
