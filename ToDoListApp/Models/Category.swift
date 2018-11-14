//
//  Category.swift
//  ToDoListApp
//
//  Created by ian schoenrock on 11/14/18.
//  Copyright © 2018 ian schoenrock. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
