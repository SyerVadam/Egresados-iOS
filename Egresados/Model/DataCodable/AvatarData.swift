//
//  AvatarData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation

struct AvatarDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : AvatarData?   = AvatarData()

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent(AvatarData.self   , forKey: .data   )
 
  }
  init() { }

}

struct AvatarData: Codable {

  var sAvatar : String? = nil

  enum CodingKeys: String, CodingKey {

    case sAvatar = "sAvatar"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sAvatar = try values.decodeIfPresent(String.self , forKey: .sAvatar )
 
  }
  init() { }

}

