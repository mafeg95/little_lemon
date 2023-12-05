//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/25/23.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let image: String
    let descriptionText: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case descriptionText = "description"
    }
}


