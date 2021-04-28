//
//  Cards+CoreDataProperties.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//
//

import Foundation
import CoreData


extension Cards {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cards> {
        return NSFetchRequest<Cards>(entityName: "Cards")
    }

    @NSManaged public var answer: String
    @NSManaged public var question: String
    @NSManaged public var timestamp: Date?
    @NSManaged public var cardDeck: Deck

}

extension Cards : Identifiable {

}
