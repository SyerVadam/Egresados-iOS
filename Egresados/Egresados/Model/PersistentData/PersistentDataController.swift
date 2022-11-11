//
//  PersistentDataController.swift
//  Egresados
//
//  Created by Israel Zavaleta on 10/11/22.
//

import Foundation
import CoreData

class PersistentDataController: ObservableObject {
    let container = NSPersistentContainer (name: "LocalDB")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print ("PersistentDataController: CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
