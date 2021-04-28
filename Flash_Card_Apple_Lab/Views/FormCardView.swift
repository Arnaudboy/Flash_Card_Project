//
//  FormCardView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//

import SwiftUI

struct FormCardView: View {
    @ObservedObject var deck = Deck()
    @ObservedObject var cardVM: CardViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context

    var body: some View {
        Form {
            Section(header: Text("recto")) {
                                TextField("Australie", text: self.$cardVM.recto)
                            }
            Section(header: Text("verso")) {
                                TextField("Canberra", text: self.$cardVM.verso)
                            }
            Button(action: {self.cardVM.addCard(context: context, deck: deck); self.presentationMode.wrappedValue.dismiss()}, label: {
                Text("Créer la carte")
            })
        }
    }
}

struct FormCardView_Previews: PreviewProvider {
    static var previews: some View {
        FormCardView(cardVM: CardViewModel())
    }
}
