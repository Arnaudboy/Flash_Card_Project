//
//  ContentView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 13/01/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var text = true
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: ListDeckView()){
                    Text("Voir les réponses")
                }
                NavigationLink(destination: ListCardsView()){
                    Text("liste de cartes")
                }
                NavigationLink(destination: CreateCardView()){
                    Text("Créer une carte")
                }
            }
            
            
        }
    }
    
}

