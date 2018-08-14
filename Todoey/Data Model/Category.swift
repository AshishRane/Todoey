//
//  Category.swift
//  Todoey
//
//  Created by Ashish Rane on 2018-08-10.
//  Copyright © 2018 Ashish Rane. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
