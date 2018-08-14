//
//  Item.swift
//  Todoey
//
//  Created by Ashish Rane on 2018-08-10.
//  Copyright © 2018 Ashish Rane. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?  //? means optional
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
