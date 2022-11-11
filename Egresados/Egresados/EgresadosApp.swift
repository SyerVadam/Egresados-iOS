//
//  EgresadosApp.swift
//  Egresados
//
//  Created by Israel Zavaleta on 17/10/22.
//

import SwiftUI

@main
struct EgresadosApp: App {
    @StateObject private var persistentDataController = PersistentDataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentDataController.container.viewContext)
        }
    }
}
