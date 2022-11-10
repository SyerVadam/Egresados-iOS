//
//  ContactoView.swift
//  Egresados
//
//  Created by Israel Zavaleta on 04/11/22.
//

import SwiftUI

struct ContactoView: View {
    var body: some View {
        VStack(spacing: 15){
            
            Text("Contacto")
                .font(Font.title2)
                .padding(.bottom, 10)
            
            Text("Redes sociales").font(Font.title3)
            HStack(spacing: 20){
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Image("Facebook").resizable().frame(width: 48, height: 48)
                }
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Image("Instagram").resizable().frame(width: 48, height: 48)
                }
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Image("Twitter").resizable().frame(width: 48, height: 48)
                }
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Image("LinkedIn").resizable().frame(width: 48, height: 48)
                }
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Image("YouTube").resizable().frame(width: 48, height: 48)
                }
            }.padding(.bottom, 30)
            
            Group{
                Text("Correo electrónico").font(Font.title3)
                Link(destination: URL(string: "mailto:jon.doe@mail.com")!) {
                    Image(systemName: "envelope").resizable().scaledToFit().frame(width: 26, height: 26)
                }
                Link("egresados@uv.mx", destination: URL(string: "mailto:jon.doe@mail.com")!)
                    .padding(.bottom, 30)
            }
            
            Group{
                Text("Teléfono de oficina").font(Font.title3)
                Link(destination: URL(string: "tel:2288421700")!) {
                    Image(systemName: "phone").resizable().scaledToFit().frame(width: 26, height: 26)
                }
                Link("(228)842-1700", destination: URL(string: "tel:2288421700")!)
                    .padding(.bottom, 30)
            }
            
            Group{
                Text("Portal").font(Font.title3)
                Link(destination: URL(string: "https://www.uv.mx/egresados/")!) {
                    Image(systemName: "network").resizable().scaledToFit().frame(width: 26, height: 26)
                }
                Link("https://www.uv.mx/egresados", destination: URL(string: "https://www.uv.mx/egresados/")!)
                    .padding(.bottom, 30)
            }
            Spacer()
        }.ignoresSafeArea()
    }
}
