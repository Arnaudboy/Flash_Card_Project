//
//  CreateDeckView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 26/04/2021.
//

import SwiftUI

struct CreateDeckView: View {
    @ObservedObject var deckVM: DeckViewModel
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    func verify() -> Bool {
        return self.deckVM.name.isEmpty ? false : true
    }
    
    var body: some View {
        Form {
            Section(header: Text("Entrez un nom")) {
                                TextField("Capitales", text: self.$deckVM.name)
                            }
            Button(action: {self.deckVM.addDeck(context: context); self.presentationMode.wrappedValue.dismiss()}, label: {
                Text("Créer le deck")
            })
        }
    }
}
