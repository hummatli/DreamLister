//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Settar Hummetli on 7/19/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
