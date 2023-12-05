//
//  MenuList.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/25/23.
//

import Foundation

struct MenuList: Codable{
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

