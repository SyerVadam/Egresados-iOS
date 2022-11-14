//
//  InternetConnection.swift
//  Egresados
//
//  Created by Israel Zavaleta on 08/11/22.
//

import Foundation
import Network

final class Network: ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published private(set) var internetConnection:Bool = false
    
    
    init(){
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.internetConnection = path.status == .satisfied ? true : false
                print("Estado de conección definido")
            }
        }
        monitor.start(queue: queue)
    }
    
//    init() {
//        monitor.pathUpdateHandler = { path in
//            if path.status == .satisfied {
//                self.internetConnection = true
//            }else{
//                self.internetConnection = false
//            }
//        }
//        monitor.start(queue: queue)
//    }
}
