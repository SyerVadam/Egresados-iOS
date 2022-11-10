//
//  ContentView.swift
//  Egresados
//
//  Created by Israel Zavaleta on 17/10/22.
//

import SwiftUI

struct ShowHidePasswordField: View{
    @State private var hidePassword: Bool = true
    @Binding var content: String
    
    var body: some View{
        HStack{
            if hidePassword {
                SecureField("Contraseña", text: $content)
                    .padding()
                    .frame(width: 325, height: 40)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }else{
                TextField(content, text: $content)
                    .padding()
                    .frame(width: 325, height: 40)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
        }.overlay(alignment: .trailing){
            Image(systemName: hidePassword ? "eye.slash":"eye")
                .onTapGesture {
                    hidePassword.toggle()
                }
                .padding(.trailing, 15)
        }
    }
}


struct ContentView: View {
    
    @StateObject var internet = Network()
    
    @State private var user: String = ""
    @State private var password: String = ""
    
    // View Triggers
    @State private var progressViewShow: Bool = true
    @State private var loggedIn: Bool = false
    
    @State var errorMessage: String = ""
    @State var errorIcon: String = ""
    @State var itemsWidth = 325.1
    @State var itesmHeight = 40.1
    
    
    
    
    var body: some View {
        VStack{
            ZStack(alignment: .center){
                if progressViewShow{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(3)
                        .shadow(color: .green, radius: 3.1)
                        .foregroundColor(.gray)
                }
                
                if loggedIn {
                    SecondContentView(loggedIn: $loggedIn)
                    
                }else{
                    VStack(spacing: 20){
                        Image("EgresadosLogo")
                            .resizable()
                            .frame(width: 300, height: 300)
                        
                        HStack(){
                            if (errorIcon != ""){
                                Image(systemName: errorIcon)
                                    .padding(.leading, 37)
                                    .foregroundColor(.red)
                            }
                            Text(errorMessage)
                                .foregroundColor(.red)
                            Spacer()
                        }
                        
                        Group{
                            
                            
                            TextField("Usuario", text: $user)
                                .padding()
                                .frame(width: itemsWidth, height: itesmHeight)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                            
                            ShowHidePasswordField(content: $password)
                            
                            
                            Button(action: {
                                errorMessage = ""
                                errorIcon = ""
                                if !checkFields(){
                                }else{
                                    login(user: user, password: password)
                                }
                                
                            }, label: {
                                Text("Iniciar sesion")
                                    .foregroundColor(.white)
                                    .frame(width: itemsWidth, height: itesmHeight)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            })
                            .frame(width: itemsWidth, height: itesmHeight)
                            .cornerRadius(10)
                            .padding(.top, 5)
                        }
                        Spacer()
                        Button("Registrarse"){
                            
                        }
                        .foregroundColor(.blue)
                        .frame(width: itemsWidth, height: itesmHeight)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(10)
                        
                        Button("Recuperar usuario o contraseña"){
                            
                        }
                        .foregroundColor(.blue)
                        .frame(width: itemsWidth, height: itesmHeight)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                }
            }
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()){
                isAlreadyLoggedIn()
            }
        }
    }
    
    
    func isConnectedToInternet() -> Bool {
        if self.internet.internetConnection {
            return true
        }
        
        print("No hay conexión a Internet")
        errorMessage = "Sin conexión a Internet"
        errorIcon = "wifi.slash"
        return false
    }
    
    func checkFields() -> Bool {
        let userEmpty: Bool = user.lowercased().isEmpty
        let passwordEmpty: Bool = password.lowercased().isEmpty
        
        if(userEmpty && passwordEmpty){
            errorMessage = "Debes escribir tu usuario y contraseña"
            errorIcon = "exclamationmark.circle"
            return false;
        }
        if(userEmpty){
            errorMessage = "Debes escribir tu usuario"
            errorIcon = "exclamationmark.circle"
            return false;
        }
        if(passwordEmpty){
            errorMessage = "Debes escribir tu contraseña"
            errorIcon = "exclamationmark.circle"
            return false;
        }
        
        return true;
    }
    
    
    func login(user: String, password: String){
        if isConnectedToInternet(){
            progressViewShow = true
            ServerConector.shared.POST_LogIn(user: user, password: password) { (logData) in
                
                if(logData.status == 200){
                    DispatchQueue.main.asyncAfter(deadline: .now()){
                        print("Sesión iniciada")
                        progressViewShow = false
                        loggedIn = true
                    }
                    return
                }
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    progressViewShow = false
                    errorMessage = "El usuario y/o la contraseña \nson incorrectos"
                    errorIcon = "x.circle"
                }
                
            } requestFailure: { (error) in
                
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    print(error.debugDescription)
                    progressViewShow = false
                    errorMessage = "Ha ocurrido un error inesperado,\nintenta de nuevo más tarde"
                    errorIcon = "x.circle"
                }
            }
        }
    }
    
    func isAlreadyLoggedIn(){
        progressViewShow = true
        
        if isConnectedToInternet(){
            if let savedBearerToken = UserDefaults.standard.string(forKey: "bearerToken"){
                print("Token existente: validando...")
                ServerConector.shared.tokenIsEnabled(savedBearerToken: savedBearerToken) { infoUsuarioData in
                    loggedIn = true
                } requestFailure: { error in
                }
            }else{
                print("No existe un token almacenado")
            }
        }else{
            if UserDefaults.standard.string(forKey: "bearerToken") != nil{
                print("Token existente: Acceso sin Internet")
                loggedIn = true
            }else{
                print("No existe un token almacenado, sin Internet")
            }
        }
        
        progressViewShow = false
    }
}


struct ContentView_Previews: PreviewProvider {
    var internet = Network()
    static var previews: some View {
        ContentView()
    }
}
