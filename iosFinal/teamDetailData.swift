//
//  teamDetailData.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import Foundation

struct teamDetail:Codable{
    var id:String
    var name:String
    var market:String
    var alias:String
    var founded:Int
    var venue:venue
    var league:league
    var conference:conference
    var division:division
    var coaches:[coach]
    var players:[player]
}
struct division :Codable{
    var id:String
    var name:String
    var alias :String
}
struct venue:Codable{
    var id:String
    var name:String
    var capacity:Int
    var address:String
    var city:String
    var state:String
    var zip:String
    var country:String
}

struct conference:Codable{
    var id :String
    var name:String
    var alias :String
    
    
}
struct coach:Codable{
    var id:String
    var full_name:String
    var first_name:String
    var last_name:String
    var position:String
    var experience:String
    
}

struct player:Codable{
    var id:String
    var status:String?
     var full_name:String
     var first_name:String
     var last_name:String
    var abbr_name:String?
    var height:Int
    var weight:Int
    var position:String?
    var primary_position:String?
    var jersey_number:String?
    var experience:String?
    var college:String?
    var high_school:String?
    var birth_place:String?
    var birthdate:String?
    var updated:String?
    var draft:draft?
}

struct draft:Codable{
    var team_id:String?
    var year:Int
    var round:String?
    var pick:String?
    
}
