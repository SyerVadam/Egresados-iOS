//
//  DetalleVacanteData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation

struct DetalleVacanteDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : DetalleVacanteData?   = DetalleVacanteData()

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent(DetalleVacanteData.self   , forKey: .data   )
 
  }
  init() { }
}

struct DetalleVacanteData: Codable {

  var nId               : Int?       = nil
  var sNombre           : String?    = nil
  var sFechaPublicacion : String?    = nil
  var sFechaVigencia    : String?    = nil
  var sNivelJerarquia   : String?    = nil
  var sAreaTrabajo      : String?    = nil
  var nCantidadVacantes : Int?       = nil
  var sPais             : String?    = nil
  var sEstado           : String?    = nil
  var sCiudad           : String?    = nil
  var lsAptitudes       : [String]?  = []
  var lsIdiomas         : [String]?  = []
  var sComentarios      : String?    = nil
  var moEmpresa         : MoEmpresa? = MoEmpresa()

  enum CodingKeys: String, CodingKey {

    case nId               = "nId"
    case sNombre           = "sNombre"
    case sFechaPublicacion = "sFecha_publicacion"
    case sFechaVigencia    = "sFecha_vigencia"
    case sNivelJerarquia   = "sNivel_jerarquia"
    case sAreaTrabajo      = "sArea_trabajo"
    case nCantidadVacantes = "nCantidad_vacantes"
    case sPais             = "sPais"
    case sEstado           = "sEstado"
    case sCiudad           = "sCiudad"
    case lsAptitudes       = "lsAptitudes"
    case lsIdiomas         = "lsIdiomas"
    case sComentarios      = "sComentarios"
    case moEmpresa         = "moEmpresa"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    nId               = try values.decodeIfPresent(Int.self       , forKey: .nId               )
    sNombre           = try values.decodeIfPresent(String.self    , forKey: .sNombre           )
    sFechaPublicacion = try values.decodeIfPresent(String.self    , forKey: .sFechaPublicacion )
    sFechaVigencia    = try values.decodeIfPresent(String.self    , forKey: .sFechaVigencia    )
    sNivelJerarquia   = try values.decodeIfPresent(String.self    , forKey: .sNivelJerarquia   )
    sAreaTrabajo      = try values.decodeIfPresent(String.self    , forKey: .sAreaTrabajo      )
    nCantidadVacantes = try values.decodeIfPresent(Int.self       , forKey: .nCantidadVacantes )
    sPais             = try values.decodeIfPresent(String.self    , forKey: .sPais             )
    sEstado           = try values.decodeIfPresent(String.self    , forKey: .sEstado           )
    sCiudad           = try values.decodeIfPresent(String.self    , forKey: .sCiudad           )
    lsAptitudes       = try values.decodeIfPresent([String].self  , forKey: .lsAptitudes       )
    lsIdiomas         = try values.decodeIfPresent([String].self  , forKey: .lsIdiomas         )
    sComentarios      = try values.decodeIfPresent(String.self    , forKey: .sComentarios      )
    moEmpresa         = try values.decodeIfPresent(MoEmpresa.self , forKey: .moEmpresa         )
 
  }
    init() { }

}

struct MoEmpresa: Codable {

  var sNombre   : String? = nil
  var sSector   : String? = nil
  var sPais     : String? = nil
  var sEstado   : String? = nil
  var sCiudad   : String? = nil
  var sTelefono : String? = nil
  var sEmail    : String? = nil
  var sSitioWeb : String? = nil
  var sLogo     : String? = nil
  var nId       : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case sNombre   = "sNombre"
    case sSector   = "sSector"
    case sPais     = "sPais"
    case sEstado   = "sEstado"
    case sCiudad   = "sCiudad"
    case sTelefono = "sTelefono"
    case sEmail    = "sEmail"
    case sSitioWeb = "sSitio_web"
    case sLogo     = "sLogo"
    case nId       = "nId"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sNombre   = try values.decodeIfPresent(String.self , forKey: .sNombre   )
    sSector   = try values.decodeIfPresent(String.self , forKey: .sSector   )
    sPais     = try values.decodeIfPresent(String.self , forKey: .sPais     )
    sEstado   = try values.decodeIfPresent(String.self , forKey: .sEstado   )
    sCiudad   = try values.decodeIfPresent(String.self , forKey: .sCiudad   )
    sTelefono = try values.decodeIfPresent(String.self , forKey: .sTelefono )
    sEmail    = try values.decodeIfPresent(String.self , forKey: .sEmail    )
    sSitioWeb = try values.decodeIfPresent(String.self , forKey: .sSitioWeb )
    sLogo     = try values.decodeIfPresent(String.self , forKey: .sLogo     )
    nId       = try values.decodeIfPresent(Int.self    , forKey: .nId       )
 
  }
  init() { }

}
