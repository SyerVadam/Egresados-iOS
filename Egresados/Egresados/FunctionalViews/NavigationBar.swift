//
//  NavigationBar.swift
//  Egresados
//
//  Created by Israel Zavaleta on 31/10/22.
//

import SwiftUI
struct NavigationBar: View {
    
    @Binding var loggedIn: Bool
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 45){
            
            Text("Egresados")
                .padding(.all, 20)
                .font(Font.title2)
            
            Spacer()
            
            Button{
                UserDefaults.standard.removeObject(forKey: "bearerToken")
                loggedIn = false
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            
            Button{
                
            } label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                    .foregroundColor(.black).opacity(0.75)
            }
            .padding(.trailing, 20)
            
            
            
        }
            .frame(height: 40)
        
    }
}


