//
//  PlayerStats.swift
//  Westfield_App
//
//  Created by Apps2M on 7/3/23.
//
import UIKit

class PlayerStats: ObservableObject, Identifiable {
    
    @Published var id: Int
    @Published var steamID:Int = 0
    @Published var XP: Int
    @Published var LVL: Int
    @Published var dollars: Int
    @Published var timePlayed: String
    @Published var kills: Int
    @Published var deaths: Int
    @Published var HS: Int
    @Published var wins: Int
    @Published var lost: Int

    init(_json: [String: Any]){
        
        id = _json["ID"] as? Int ?? 0
        
        steamID = _json["steamID"] as? Int ?? 0
        
        XP = _json["XP"] as? Int ?? 234562
        
        LVL = _json["LVL"] as? Int ?? 34
        
        dollars = _json["dollars"] as? Int ?? 53252
        
        let unformattedTime: Double = _json["timePlayed"] as? Double ?? 4267989174
        
        timePlayed = DateFormatterManager.FormatDate(_date: unformattedTime)
        
        kills = _json["kills"] as? Int ?? 452
        
        deaths = _json["deaths"] as? Int ?? 54
        
        HS = _json["HS"] as? Int ?? 135
        
        wins = _json["wins"] as? Int ?? 44
        
        lost = _json["lost"] as? Int ?? 26
    }
        
}
