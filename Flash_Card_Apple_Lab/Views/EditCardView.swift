//
//  EditCardView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 27/04/2021.
//

import SwiftUI

struct EditCardView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    @StateObject var cardsVM = CardViewModel()
    @Environment(\.managedObjectContext) var context
    let cardToEdit: Cards
    var body: some View {
        Form{
            Section(header: Text("Question")){
                TextField("\(self.cardToEdit.question)", text: $question)
            }
            Section(header: Text("Answer")){
                TextField("\(self.cardToEdit.answer)", text: $answer)
            }
        }
        Button(action: {self.cardsVM.update(context: context, card: cardToEdit, question: question, answer: answer)}, label: {
            Text("Editer")
        })
    }
}

//struct EditCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCardView()
//    }
//}
