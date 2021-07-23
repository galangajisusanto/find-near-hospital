//
//  Hospital.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 13/07/21.
//

import Foundation


struct Hospital : Codable,Equatable{
    var name : String
    var address : String
    var region : String
    var phone : String?
    var province : String
    var image : String
}
