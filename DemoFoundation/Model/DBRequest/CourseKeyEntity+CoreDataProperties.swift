//
//  CourseKeyEntity+CoreDataProperties.swift
//  
//
//  Created by Foryou on 2018/9/12.
//
//

import Foundation
import CoreData


extension CourseKeyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CourseKeyEntity> {
        return NSFetchRequest<CourseKeyEntity>(entityName: "CourseKeyEntity")
    }

    @NSManaged public var title: String?

}
