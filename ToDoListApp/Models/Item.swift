//
//  Item.swift
//  ToDoListApp
//
//  Created by ian schoenrock on 11/14/18.
//  Copyright © 2018 ian schoenrock. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
