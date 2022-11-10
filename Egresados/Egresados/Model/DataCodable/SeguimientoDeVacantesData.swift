//
//  SeguimientoDeVacantesData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

struct SeguimientoVacantesDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : [SeguimientoVacantesData]? = []

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent([SeguimientoVacantesData].self , forKey: .data   )
 
  }

  init() { }

}

struct SeguimientoVacantesData: Codable {

  var nIdVacante    : Int?    = nil
  var sMatricula    : String? = nil
  var nIdEstatus    : Int?    = nil
  var sEstatus      : String? = nil
  var sEmpleo       : String? = nil
  var sOrganizacion : String? = nil
  var sUbicacion    : String? = nil
  var sFechaEnvioCV : String? = nil
  var sTelefono     : String? = nil
  var sSitioWeb     : String? = nil
  var sEmail        : String? = nil

  enum CodingKeys: String, CodingKey {

    case nIdVacante    = "nIdVacante"
    case sMatricula    = "sMatricula"
    case nIdEstatus    = "nIdEstatus"
    case sEstatus      = "sEstatus"
    case sEmpleo       = "sEmpleo"
    case sOrganizacion = "sOrganizacion"
    case sUbicacion    = "sUbicacion"
    case sFechaEnvioCV = "sFecha_envioCV"
    case sTelefono     = "sTelefono"
    case sSitioWeb     = "sSitio_web"
    case sEmail        = "sEmail"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    nIdVacante    = try values.decodeIfPresent(Int.self    , forKey: .nIdVacante    )
    sMatricula    = try values.decodeIfPresent(String.self , forKey: .sMatricula    )
    nIdEstatus    = try values.decodeIfPresent(Int.self    , forKey: .nIdEstatus    )
    sEstatus      = try values.decodeIfPresent(String.self , forKey: .sEstatus      )
    sEmpleo       = try values.decodeIfPresent(String.self , forKey: .sEmpleo       )
    sOrganizacion = try values.decodeIfPresent(String.self , forKey: .sOrganizacion )
    sUbicacion    = try values.decodeIfPresent(String.self , forKey: .sUbicacion    )
    sFechaEnvioCV = try values.decodeIfPresent(String.self , forKey: .sFechaEnvioCV )
    sTelefono     = try values.decodeIfPresent(String.self , forKey: .sTelefono     )
    sSitioWeb     = try values.decodeIfPresent(String.self , forKey: .sSitioWeb     )
    sEmail        = try values.decodeIfPresent(String.self , forKey: .sEmail        )
 
  }

  init() {

  }

}

