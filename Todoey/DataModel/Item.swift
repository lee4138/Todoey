//
//  Item.swift
//  Todoey
//
//  Created by Linh Doan on 4/20/18.
//  Copyright © 2018 Linh Doan. All rights reserved.
//

import Foundation

// conforms to encodable and decodable 
class Item: Codable {
    
    var title : String = ""
    var done: Bool =  false
    
}
