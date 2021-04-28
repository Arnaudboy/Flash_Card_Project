//
//  ListDeckView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 28/04/2021.
//

import SwiftUI

struct ListDeckView: View {
    @StateObject var cardVM = CardViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Cards.entity(), sortDescriptors: [NSSortDescriptor(key: "question", ascending: true)])
    var cards: FetchedResults<Cards>
    
    var body: some View {
            List{
                Section{
                    ForEach(cards){ card in
                        NavigationLink(
                            destination: CardView(text: card.question, text2: card.answer),
                            label: {
                                Text(card.question)
                                Text(card.cardDeck.name)
                            })
                        
                    }
                }
            }
        
        
    }
}
    struct ListDeckView_Previews: PreviewProvider {
        static var previews: some View {
            ListDeckView()
        }
    }
