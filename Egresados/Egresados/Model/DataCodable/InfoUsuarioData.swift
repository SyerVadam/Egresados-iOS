//
//  InfoUsuarioData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation

struct InfoUsuarioDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : InfoUsuarioData?   = InfoUsuarioData()

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent(InfoUsuarioData.self   , forKey: .data   )
 
  }

  init() {

  }

}

struct InfoUsuarioData: Codable {

  var nIdEgresado           : Int?    = nil
  var sNombre               : String? = nil
  var sApellidoPaterno      : String? = nil
  var sApellidoMaterno      : String? = nil
  var sGenero               : String? = nil
  var sFechaNacimiento      : String? = nil
  var sAvatar               : String? = nil
  var sExpiracionCredencial : String? = nil

  enum CodingKeys: String, CodingKey {

    case nIdEgresado           = "nId_egresado"
    case sNombre               = "sNombre"
    case sApellidoPaterno      = "sApellido_paterno"
    case sApellidoMaterno      = "sApellido_materno"
    case sGenero               = "sGenero"
    case sFechaNacimiento      = "sFecha_nacimiento"
    case sAvatar               = "sAvatar"
    case sExpiracionCredencial = "sExpiracion_credencial"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    nIdEgresado           = try values.decodeIfPresent(Int.self    , forKey: .nIdEgresado           )
    sNombre               = try values.decodeIfPresent(String.self , forKey: .sNombre               )
    sApellidoPaterno      = try values.decodeIfPresent(String.self , forKey: .sApellidoPaterno      )
    sApellidoMaterno      = try values.decodeIfPresent(String.self , forKey: .sApellidoMaterno      )
    sGenero               = try values.decodeIfPresent(String.self , forKey: .sGenero               )
    sFechaNacimiento      = try values.decodeIfPresent(String.self , forKey: .sFechaNacimiento      )
    sAvatar               = try values.decodeIfPresent(String.self , forKey: .sAvatar               )
    sExpiracionCredencial = try values.decodeIfPresent(String.self , forKey: .sExpiracionCredencial )
 
  }

  init() {

  }

}

