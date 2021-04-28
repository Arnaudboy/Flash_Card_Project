//
//  DeckViewModel.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 26/04/2021.
//

import Foundation
import CoreData

class DeckViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isAddPresented: Bool = false
    fileprivate let deckReq = NSFetchRequest<Deck>(entityName: "Deck")
    public func addDeck(context: NSManagedObjectContext) -> Void{
        self.deckReq.sortDescriptors = [NSSortDescriptor(keyPath: \Deck.name, ascending: true)]
        
        let newDeck = Deck(context: context)
        newDeck.name = self.name

        do {
            
            try context.save()
            self.resetValues()
            self.isAddPresented.toggle()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetValues() -> Void {
        name = ""
    }
}
