//
//  ServerConector.swift
//  EgresadosUV
//
//  Created by Israel Zavaleta on 07/10/22.
//

import Foundation
import Alamofire
import Security
 
final class ServerConector{
    static let shared = ServerConector()
    private let URLBase = "https://dsia.uv.mx/webapi/estudiantes/apisseuv/"
    private let kStatusOk = 200...299
    
    func tokenIsEnabled(requestSucess: @escaping (_ infoUsuarioData: InfoUsuarioDecodableData) -> (),
                        requestFailure: @escaping (_ error: Error?) -> () ){
       
       let url = "\(URLBase)sseuvMovil/InfoUsuario"
       let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "bearerToken") ?? "")]
       AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: InfoUsuarioDecodableData.self) { response in
           
           if let infoUsuarioData = response.value{
               print("Request exitoso, el token aún funciona")
               requestSucess(infoUsuarioData)
               
           }else{
               print("Request fallido, el token ha expirado")
               requestFailure(response.error)
           }
       }
    }
    
    func POST_LogIn (user: String, password: String,
                     requestSuccess: @escaping (_ logData: LogDecodableData) -> (),
                     requestFailure: @escaping (_ error: Error?) -> () ){
        //let url = "\(URLBase)sseuvMovilLogin/Login"
        let url = "https://dsia.uv.mx/webapi/estudiantes/apisseuv/sseuvMovilLogin/Login"
        let parameters: [String: Any] = [
            "sUsuario": "\(user)",
            "sPassword": "\(password)"
        ]

        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate(statusCode: 200...400).responseDecodable (of: LogDecodableData.self){ response in
            
            
            if let logData = response.value {
                
                // Almacena BearerToken
                var bearerTokenUser: String = ""
                bearerTokenUser = response.response?.allHeaderFields["Authorization"] as? String ?? ""
                if let range = bearerTokenUser.range(of: "Bearer "){
                    bearerTokenUser.removeSubrange(range)
                    UserDefaults.standard.set(bearerTokenUser, forKey: "bearerToken")
                }
                print("Request LogIn exitosa")
                requestSuccess(logData)
               
            }else{
                print("Request LogIn fallida")
                requestFailure(response.error)
            }
        }

    }
    
    func GET_InfoUsuario(requestSucess: @escaping (_ infoUsuarioData: InfoUsuarioDecodableData) -> (),
                         requestFailure: @escaping (_ error: Error?) -> () ){
        
        let url = "\(URLBase)sseuvMovil/InfoUsuario"
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "bearerToken") ?? "")]
        
        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: InfoUsuarioDecodableData.self) { response in
            
            if let infoUsuarioData = response.value{
                print("Request InfoUsuario exitosa")
                requestSucess(infoUsuarioData)
                
            }else{
                print("request InfoUsuario fallida")
                requestFailure(response.error)
            }
        }
    }
    
    func GET_Vacantes(requestSuccess: @escaping (_ vacantesData: VacantesDecodableData) -> (), requestFailure: @escaping (_ error: Error?) -> () ) {
        
        let url = "\(URLBase)sseuvMovil/Vacantes"
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "bearerToken") ?? "")]
        
        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: VacantesDecodableData.self) { response in
            
            if let vacantesData = response.value{
                print("Request Vacantes exitosa")
                requestSuccess(vacantesData)
             
            }else{
                print("request Vacantes fallida")
                print(response.error?.errorDescription ?? "Sin código de error")
                requestFailure(response.error)
            }
        }
    }
    
//    func GET_LogOut (){
//        let url = "\(URLBase)sseuvMovilLogin/Logout"
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(self.bearerTokenUser)"
//        ]
//
//        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: LogDecodableData.self) { response in
//            if let egresadoData = response.value{
//                print("LOGout EXITOSO")
//                print(String(egresadoData.status ?? 0))
//            }else{
//                print(response.error?.errorDescription ?? "Sin código de error")
//            }
//        }
//    }
//
//
//    func GET_Egresado (){
//
//        let url = "\(URLBase)sseuvMovil/Egresado"
//        let headers: HTTPHeaders = [.authorization(bearerToken: self.bearerTokenUser)]
//
//        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: EgresadoDecodableData.self) { response in
//
//            if let egresadoData = response.value{
//                print(egresadoData.data?.sNombre ?? "")
//                print(egresadoData.data?.infoElectronica?.sCorreoPersonal ?? "")
//                print(egresadoData.data?.infoEscolar?[0].sProgramaEducativo ?? "")
//                print(egresadoData.data?.infoLaboral?.sNombre ?? "")
//            }else{
//                print(response.error?.errorDescription ?? "Sin código de error")
//            }
//        }
//    }
//
//    func GET_DetalleVacante(idVacante: Int){
//
//        let url = "\(URLBase)sseuvMovil/DetalleVacante"
//        let headers: HTTPHeaders = [.authorization(bearerToken: self.bearerTokenUser)]
//        let parameters: Parameters = [
//                "nVacante": "\(idVacante)"
//                ]
//
//        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: DetalleVacanteDecodableData.self) { response in
//
//            if let detalleVacanteData = response.value{
//                print(detalleVacanteData.data?.sNombre ?? "")
//
//            }else{
//                print(response.error?.errorDescription ?? "Sin código de error")
//            }
//        }
//    }
//
//    func GET_SeguimientoVacantes(){
//        let url = "\(URLBase)sseuvMovil/SeguimientoVacantes"
//        let headers: HTTPHeaders = [.authorization(bearerToken: self.bearerTokenUser)]
//
//        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: SeguimientoVacantesDecodableData.self) { response in
//
//            if let seguimientoVacantesData = response.value{
//                print(seguimientoVacantesData.data?.description ?? "")
//
//            }else{
//                print(response.error?.errorDescription ?? "Sin código de error")
//            }
//        }
//    }
//
//    func GET_Avatar() {
//        let url = "\(URLBase)sseuvMovil/ObtieneAvatar"
//        let headers: HTTPHeaders = [.authorization(bearerToken: self.bearerTokenUser)]
//
//        AF.request(url, method: .get, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: AvatarDecodableData.self ) { response in
//
//            if let avatarData = response.value{
//                print(avatarData.data?.sAvatar ?? "")
//            }else{
//                print(response.error?.errorDescription ?? "Sin código de error")
//            }
//        }
//    }
    
   
}

