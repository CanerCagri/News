//
//  News.swift
//  News
//
//  Created by Caner Çağrı on 5.04.2022.
//

import Foundation

//GET & POST - Taking data from json with decodable protocol
struct News : Decodable {
    var title : String
    var story : String
    
    
}
