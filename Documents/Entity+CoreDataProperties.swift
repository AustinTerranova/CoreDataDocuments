//
//  Entity+CoreDataProperties.swift
//  Documents
//
//  Created by Austin Terranova on 2/21/19.
//  Copyright © 2019 Dale Musser. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var size: Int64
    @NSManaged public var name: String
    @NSManaged public var content: String
    @NSManaged public var dateModified: Date

}
