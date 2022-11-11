//
//  TabBar.swift
//  Egresados
//
//  Created by Israel Zavaleta on 28/10/22.
//

import SwiftUI

enum PressedTab: CustomStringConvertible{
    case avisos
    case bolsaDeTrabajo
    case contacto
    case credencial
    
    var description: String{
        switch self{
        case .avisos: return "Avisos"
        case .bolsaDeTrabajo: return "Bolsa de trabajo"
        case .contacto: return "Contacto"
        case .credencial: return "Credencial"
        }
    }
}

struct TabBar: View {
    @Binding var pressedTab: PressedTab
    
    var body: some View{
        
        HStack(alignment: .center){
            TabButton(tabName: PressedTab.avisos, tabImageName: "newspaper.fill", pressedTab: $pressedTab)
            TabButton(tabName: PressedTab.bolsaDeTrabajo, tabImageName: "bag.fill", pressedTab: $pressedTab)
            TabButton(tabName: PressedTab.contacto, tabImageName: "envelope.fill", pressedTab: $pressedTab)
            TabButton(tabName: PressedTab.credencial, tabImageName: "person.text.rectangle.fill", pressedTab: $pressedTab)
        }
        .frame(height: 55)
    }
}

struct TabButton: View {
    
    @State var tabName: PressedTab
    @State var tabImageName: String
    @Binding var pressedTab: PressedTab
    //
    
    var body: some View {
        Button {
            pressedTab = tabName
        } label: {
            GeometryReader { geo in
                
                Group{
                    if (tabName == pressedTab){
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 2)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4){
                        
                        Image(systemName: tabImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                        
                        if (tabName == pressedTab){
                            Text(tabName.description)
                                .font(Font.caption)
                        }else{
                            
                        }
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
        }
    }

}
