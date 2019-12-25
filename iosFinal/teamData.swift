//
//  teamData.swift
//  iosFinal
//
//  Created by User14 on 2019/12/24.
//  Copyright © 2019 tflee. All rights reserved.
//

import Foundation

struct rankArr : Codable{
    
    var league:league
    var season:season
    var conferences :[conferences]
}

struct league : Codable{
    var id:String
    var name:String
    var alias:String
}

struct season : Codable{
    var id:String
    var year:Int
    var type:String
}

struct conferences : Codable{
    
    var id:String
    var name:String
    var alias:String
    var divisions:[divisions]
}

struct divisions : Codable{
    var id:String
    var name:String
    var alias:String
    var teams:[teams]
}

struct teams:Codable{
    var id:String
    var name:String
    var market:String
    var rank:rank
}

struct rank:Codable{
    var conference:Int
    var division:Int
}
