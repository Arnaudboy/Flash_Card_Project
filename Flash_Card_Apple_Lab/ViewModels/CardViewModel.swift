//
//  CardViewModel.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//

import Foundation
import CoreData

class CardViewModel: ObservableObject {
    @Published var recto: String = ""
    @Published var verso: String = ""
    @Published var isAddPresented: Bool = false
    fileprivate let deckCards = NSFetchRequest<Cards>(entityName: "Cards")

    public func addCard(context: NSManagedObjectContext, deck: Deck) -> Void{
        
        let newCard = Cards(context: context)
        newCard.question = self.recto
        newCard.answer = self.verso
        newCard.cardDeck = deck
        do {
            try context.save()
            self.resetValues()
            self.isAddPresented.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
    public func deleteCard(context: NSManagedObjectContext, card: NSManagedObject) {
        context.delete(card)
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    public func update(context: NSManagedObjectContext, card: NSManagedObject, question: String, answer: String){
        
        let allCards: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Cards")
        do {
            let fetchedCards = try context.fetch(allCards) as! [Cards]
            try fetchedCards.forEach {
                cardFetched in
                if cardFetched.objectID === card.objectID {
                    cardFetched.question = question
                    cardFetched.answer = answer
                }
                try context.save()
            }
            
        }catch {
            print(error.localizedDescription)
        }
    }
    func resetValues() -> Void {
        recto = ""
        verso = ""
    }
}
