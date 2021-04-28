//
//  ListCardsView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//

import SwiftUI

struct ListCardsView: View {
    @StateObject var cardVM = CardViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Cards.entity(), sortDescriptors: [NSSortDescriptor(key: "question", ascending: true)])
    var cards: FetchedResults<Cards>
    
    var body: some View {
            List{
                Section{
                    ForEach(cards){ card in
                        NavigationLink(
                            destination: EditCardView(cardToEdit: card),
                            label: {
                                Text(card.question)
                                Text(card.cardDeck.name)
                            })
                        
                    }.onDelete(perform: { indexSet in
                        self.cardVM.deleteCard(context: context, card: cards[indexSet.first!])
                        
                    })
                }
            }
        
        
    }
}
//.onMove(perform : { indexSet, _ in
//    self.cardVM.update(context: context, card: cards[indexSet.first!], question: cards[indexSet.first!].question, answer: cards[indexSet.first!].answer)
//})
struct ListCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardsView()
    }
}
