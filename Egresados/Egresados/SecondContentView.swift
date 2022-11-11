//
//  SecondContentView.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import SwiftUI


struct SecondContentView: View{
    
    @StateObject var internet = Network()
    @Binding var loggedIn: Bool
    @State var pressedTab: PressedTab = PressedTab.contacto
    
    @State var isOfflineMode: Bool = false
    
    
    var body: some View{
        VStack{
            
            NavigationBar(loggedIn: $loggedIn)
            
            Divider()
            Spacer()
            
            Group{
                
                if (pressedTab == .avisos){
                    if internet.internetConnection{
                        BolsaView()
                    }else{
                        VStack{
                            Spacer()
                            Image(systemName: "wifi.slash").resizable().scaledToFit().frame(width: 50, height: 50).padding(.bottom, 25)
                            Text("No hay conexión a Internet")
                            Spacer()
                        }
                    }
                }
                        
                if (pressedTab == .bolsaDeTrabajo){
                    if internet.internetConnection{
                        // Vista BolsaDeTrabajo
                    }else{
                        VStack{
                            Spacer()
                            Image(systemName: "wifi.slash").resizable().scaledToFit().frame(width: 50, height: 50).padding(.bottom, 25)
                            Text("No hay conexión a Internet")
                            Spacer()
                        }
                    }
                }
                
                if (pressedTab == .contacto){
                    ContactoView()
                }
                
                if (pressedTab == .credencial) {
                        
                }
            }
            
            Spacer()
            Divider()
            
            TabBar(pressedTab: $pressedTab)
        }
    }
}
