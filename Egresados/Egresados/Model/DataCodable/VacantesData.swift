//
//  VacantesData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation

struct VacantesDecodableData: Codable {
  var status : Int?    = nil
  var error  : String? = nil
  var data   : [VacantesData]? = []

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent([VacantesData].self , forKey: .data   )
 
  }

  init() {

  }

}

struct VacantesData: Codable, Identifiable {
  var id = UUID()
  var nId            : Int? = nil
  var sVacante       : String? = nil
  var sFecha         : String? = nil
  var sLocalizacion  : String? = nil
  var sNombreEmpresa : String? = nil
  var sSalario       : String? = nil
  var sTipoVacante   : String? = nil
  var sUrlDetalle    : String? = nil

  enum CodingKeys: String, CodingKey {

    case nId            = "nId"
    case sVacante       = "sVacante"
    case sFecha         = "sFecha"
    case sLocalizacion  = "sLocalizacion"
    case sNombreEmpresa = "sNombre_empresa"
    case sSalario       = "sSalario"
    case sTipoVacante   = "sTipo_vacante"
    case sUrlDetalle    = "sUrl_Detalle"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    nId            = try values.decodeIfPresent(Int.self    , forKey: .nId            )
    sVacante       = try values.decodeIfPresent(String.self , forKey: .sVacante       )
    sFecha         = try values.decodeIfPresent(String.self , forKey: .sFecha         )
    sLocalizacion  = try values.decodeIfPresent(String.self , forKey: .sLocalizacion  )
    sNombreEmpresa = try values.decodeIfPresent(String.self , forKey: .sNombreEmpresa )
    sSalario       = try values.decodeIfPresent(String.self , forKey: .sSalario       )
    sTipoVacante   = try values.decodeIfPresent(String.self , forKey: .sTipoVacante   )
    sUrlDetalle    = try values.decodeIfPresent(String.self , forKey: .sUrlDetalle    )
 
  }

  init() {

  }
    
    init(nId: Int, sVacante: String, sFecha: String, sLocalizacion: String, sNombreEmpresa: String, sSalario: String, sTipoVacante: String, sUrlDetalle: String) {
        self.nId = nId
        self.sVacante = sVacante
        self.sFecha = sFecha
        self.sLocalizacion = sLocalizacion
        self.sNombreEmpresa = sNombreEmpresa
        self.sSalario = sSalario
        self.sTipoVacante = sTipoVacante
        self.sUrlDetalle = sUrlDetalle
        
    }

}

