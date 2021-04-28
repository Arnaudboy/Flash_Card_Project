//
//  CreateCardView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 31/03/2021.
//

import SwiftUI
import CoreData
import Foundation

struct CreateCardView: View {
    @StateObject var deckVM = DeckViewModel()
    @State private var isAddPresented = false
    @FetchRequest(entity: Deck.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    var decks: FetchedResults<Deck>
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    ForEach(decks) { deck in
                        Section {
                            NavigationLink(deck.name, destination: FormCardView(deck: deck, cardVM: CardViewModel() ))
                        }
                    }
                }
            }.navigationBarItems(trailing:
                                    Button(action: { self.isAddPresented.toggle() }) {
                                        HStack {
                                            Image(systemName: "plus")
                                                .font(.title)
                                        }
                                    }).sheet(isPresented: $isAddPresented) {
                                        CreateDeckView(deckVM: deckVM)
                                    }
        }
    }
    
}

struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardView()
    }
}

