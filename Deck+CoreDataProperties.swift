//
//  Deck+CoreDataProperties.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//
//

import Foundation
import CoreData


extension Deck {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var name: String
    @NSManaged public var deckCards: NSSet?

}

// MARK: Generated accessors for deckCards
extension Deck {

    @objc(addDeckCardsObject:)
    @NSManaged public func addToDeckCards(_ value: Cards)

    @objc(removeDeckCardsObject:)
    @NSManaged public func removeFromDeckCards(_ value: Cards)

    @objc(addDeckCards:)
    @NSManaged public func addToDeckCards(_ values: NSSet)

    @objc(removeDeckCards:)
    @NSManaged public func removeFromDeckCards(_ values: NSSet)

}

extension Deck : Identifiable {

}
