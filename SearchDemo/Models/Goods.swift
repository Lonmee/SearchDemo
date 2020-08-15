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
