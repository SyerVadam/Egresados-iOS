//
//  LogData.swift
//  Egresados
//
//  Created by Israel Zavaleta on 19/10/22.
//

import Foundation

struct LogDecodableData: Codable {

  var status : Int?    = nil
  var error  : String? = nil
  var data   : String? = nil

  enum CodingKeys: String, CodingKey {

    case status = "status"
    case error  = "error"
    case data   = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status = try values.decodeIfPresent(Int.self    , forKey: .status )
    error  = try values.decodeIfPresent(String.self , forKey: .error  )
    data   = try values.decodeIfPresent(String.self , forKey: .data   )
 
  }

  init() {

  }

}

