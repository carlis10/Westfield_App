//
//  PlayerStats.swift
//  Westfield_App
//
//  Created by Apps2M on 7/3/23.
//

import UIKit

class PlayerStats: ObservableObject, Identifiable {
    
    @Published var id: String
    @Published var steamID:String = ""
    @Published var XP: String
    @Published var LVL: String
    @Published var dollars: String
    @Published var timePlayed: String
    @Published var kills: String
    @Published var deaths: String
    @Published var HS: String
    @Published var wins: String
    @Published var lost: String

    init(_json: [String: Any]){
        
        id = _json["ID"] as? String ?? ""
        
        steamID = _json["steamID"] as? String ?? ""
        
        XP = _json["XP"] as? String ?? ""
        
        LVL = _json["LVL"] as? String ?? ""
        
        dollars = _json["dollars"] as? String ?? ""
        
        let unformattedTime: Double = _json["timePlayed"] as? Double ?? 0

        timePlayed = DateFormatterManager.FormatDate(_date: unformattedTime)
        
        kills = _json["kills"] as? String ?? ""
        
        deaths = _json["deaths"] as? String ?? ""
        
        HS = _json["HS"] as? String ?? ""
        
        wins = _json["wins"] as? String ?? ""
        
        lost = _json["lost"] as? String ?? ""
    }
        
}
