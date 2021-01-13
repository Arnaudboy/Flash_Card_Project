//
//  Flash_Card_Apple_LabApp.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 13/01/2021.
//

import SwiftUI

@main
struct Flash_Card_Apple_LabApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
