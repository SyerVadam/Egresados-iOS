//
//  EgresadoData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation
 
struct EgresadoDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : EgresadoData?   = EgresadoData()

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent(EgresadoData.self   , forKey: .data   )
 
  }

  init() {

  }

}

struct EgresadoData: Codable {

  var nIdEgresado           : Int?             = nil
  var sNombre               : String?          = nil
  var sApellidoPaterno      : String?          = nil
  var sApellidoMaterno      : String?          = nil
  var sGenero               : String?          = nil
  var sFechaNacimiento      : String?          = nil
  var sAvatar               : String?          = nil
  var sCurp                 : String?          = nil
  var sExpiracionCredencial : String?          = nil
  var infoElectronica       : InfoElectronica? = InfoElectronica()
  var infoEscolar           : [InfoEscolar]?   = []
  var infoLaboral           : InfoLaboral?     = InfoLaboral()

  enum CodingKeys: String, CodingKey {

    case nIdEgresado           = "nId_egresado"
    case sNombre               = "sNombre"
    case sApellidoPaterno      = "sApellido_paterno"
    case sApellidoMaterno      = "sApellido_materno"
    case sGenero               = "sGenero"
    case sFechaNacimiento      = "sFecha_nacimiento"
    case sAvatar               = "sAvatar"
    case sCurp                 = "sCurp"
    case sExpiracionCredencial = "sExpiracion_credencial"
    case infoElectronica       = "info_electronica"
    case infoEscolar           = "info_escolar"
    case infoLaboral           = "info_laboral"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    nIdEgresado           = try values.decodeIfPresent(Int.self             , forKey: .nIdEgresado           )
    sNombre               = try values.decodeIfPresent(String.self          , forKey: .sNombre               )
    sApellidoPaterno      = try values.decodeIfPresent(String.self          , forKey: .sApellidoPaterno      )
    sApellidoMaterno      = try values.decodeIfPresent(String.self          , forKey: .sApellidoMaterno      )
    sGenero               = try values.decodeIfPresent(String.self          , forKey: .sGenero               )
    sFechaNacimiento      = try values.decodeIfPresent(String.self          , forKey: .sFechaNacimiento      )
    sAvatar               = try values.decodeIfPresent(String.self          , forKey: .sAvatar               )
    sCurp                 = try values.decodeIfPresent(String.self          , forKey: .sCurp                 )
    sExpiracionCredencial = try values.decodeIfPresent(String.self          , forKey: .sExpiracionCredencial )
    infoElectronica       = try values.decodeIfPresent(InfoElectronica.self , forKey: .infoElectronica       )
    infoEscolar           = try values.decodeIfPresent([InfoEscolar].self   , forKey: .infoEscolar           )
    infoLaboral           = try values.decodeIfPresent(InfoLaboral.self     , forKey: .infoLaboral           )
 
  }

  init() {

  }

}

struct InfoElectronica: Codable {

  var sCorreoPersonal  : String? = nil
  var sCorreoAlterno   : String? = nil
  var sTelefonoCelular : String? = nil
  var sTelefonoCasa    : String? = nil

  enum CodingKeys: String, CodingKey {

    case sCorreoPersonal  = "sCorreo_personal"
    case sCorreoAlterno   = "sCorreo_alterno"
    case sTelefonoCelular = "sTelefono_celular"
    case sTelefonoCasa    = "sTelefono_casa"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sCorreoPersonal  = try values.decodeIfPresent(String.self , forKey: .sCorreoPersonal  )
    sCorreoAlterno   = try values.decodeIfPresent(String.self , forKey: .sCorreoAlterno   )
    sTelefonoCelular = try values.decodeIfPresent(String.self , forKey: .sTelefonoCelular )
    sTelefonoCasa    = try values.decodeIfPresent(String.self , forKey: .sTelefonoCasa    )
 
  }

  init() {

  }

}

struct InfoEscolar: Codable {

  var sNivel               : String? = nil
  var sEscolaridad         : String? = nil
  var nRegion              : Int?    = nil
  var sRegion              : String? = nil
  var nAreaAcademica       : Int?    = nil
  var sAreaAcademica       : String? = nil
  var nEntidadAcademica    : Int?    = nil
  var sEntidadAcademica    : String? = nil
  var sProgramaEducativo   : String? = nil
  var nIngreso             : Int?    = nil
  var nEgreso              : Int?    = nil
  var sTitulacion          : String? = nil
  var sModalidadTitulacion : String? = nil
  var sReconocimiento      : String? = nil

  enum CodingKeys: String, CodingKey {

    case sNivel               = "sNivel"
    case sEscolaridad         = "sEscolaridad"
    case nRegion              = "nRegion"
    case sRegion              = "sRegion"
    case nAreaAcademica       = "nArea_academica"
    case sAreaAcademica       = "sArea_academica"
    case nEntidadAcademica    = "nEntidad_academica"
    case sEntidadAcademica    = "sEntidad_academica"
    case sProgramaEducativo   = "sPrograma_educativo"
    case nIngreso             = "nIngreso"
    case nEgreso              = "nEgreso"
    case sTitulacion          = "sTitulacion"
    case sModalidadTitulacion = "sModalidad_titulacion"
    case sReconocimiento      = "sReconocimiento"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sNivel               = try values.decodeIfPresent(String.self , forKey: .sNivel               )
    sEscolaridad         = try values.decodeIfPresent(String.self , forKey: .sEscolaridad         )
    nRegion              = try values.decodeIfPresent(Int.self    , forKey: .nRegion              )
    sRegion              = try values.decodeIfPresent(String.self , forKey: .sRegion              )
    nAreaAcademica       = try values.decodeIfPresent(Int.self    , forKey: .nAreaAcademica       )
    sAreaAcademica       = try values.decodeIfPresent(String.self , forKey: .sAreaAcademica       )
    nEntidadAcademica    = try values.decodeIfPresent(Int.self    , forKey: .nEntidadAcademica    )
    sEntidadAcademica    = try values.decodeIfPresent(String.self , forKey: .sEntidadAcademica    )
    sProgramaEducativo   = try values.decodeIfPresent(String.self , forKey: .sProgramaEducativo   )
    nIngreso             = try values.decodeIfPresent(Int.self    , forKey: .nIngreso             )
    nEgreso              = try values.decodeIfPresent(Int.self    , forKey: .nEgreso              )
    sTitulacion          = try values.decodeIfPresent(String.self , forKey: .sTitulacion          )
    sModalidadTitulacion = try values.decodeIfPresent(String.self , forKey: .sModalidadTitulacion )
    sReconocimiento      = try values.decodeIfPresent(String.self , forKey: .sReconocimiento      )
 
  }

  init() {

  }

}

struct InfoLaboral: Codable {

  var sTrabajando      : String? = nil
  var sNombre          : String? = nil
  var sPais            : String? = nil
  var sEstado          : String? = nil
  var sCiudad          : String? = nil
  var bRelacionado     : Bool?   = nil
  var sPuesto          : String? = nil
  var nTiempoLaborando : Int?    = nil
  var sSectorEmpresa   : String? = nil
  var sTipoEmpresa     : String? = nil
  var sCorreoEmpresa   : String? = nil

  enum CodingKeys: String, CodingKey {

    case sTrabajando      = "sTrabajando"
    case sNombre          = "sNombre"
    case sPais            = "sPais"
    case sEstado          = "sEstado"
    case sCiudad          = "sCiudad"
    case bRelacionado     = "bRelacionado"
    case sPuesto          = "sPuesto"
    case nTiempoLaborando = "nTiempo_laborando"
    case sSectorEmpresa   = "sSector_empresa"
    case sTipoEmpresa     = "sTipo_empresa"
    case sCorreoEmpresa   = "sCorreo_empresa"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sTrabajando      = try values.decodeIfPresent(String.self , forKey: .sTrabajando      )
    sNombre          = try values.decodeIfPresent(String.self , forKey: .sNombre          )
    sPais            = try values.decodeIfPresent(String.self , forKey: .sPais            )
    sEstado          = try values.decodeIfPresent(String.self , forKey: .sEstado          )
    sCiudad          = try values.decodeIfPresent(String.self , forKey: .sCiudad          )
    bRelacionado     = try values.decodeIfPresent(Bool.self   , forKey: .bRelacionado     )
    sPuesto          = try values.decodeIfPresent(String.self , forKey: .sPuesto          )
    nTiempoLaborando = try values.decodeIfPresent(Int.self    , forKey: .nTiempoLaborando )
    sSectorEmpresa   = try values.decodeIfPresent(String.self , forKey: .sSectorEmpresa   )
    sTipoEmpresa     = try values.decodeIfPresent(String.self , forKey: .sTipoEmpresa     )
    sCorreoEmpresa   = try values.decodeIfPresent(String.self , forKey: .sCorreoEmpresa   )
 
  }

  init() {

  }

}

