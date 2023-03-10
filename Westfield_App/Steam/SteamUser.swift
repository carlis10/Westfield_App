//
//  SteamUser.swift
//  Westfield_App
//
//  Created by Apps2M on 20/2/23.
//

import UIKit
import SwiftUI

class SteamUser: ObservableObject, Identifiable {
    
    @Published var userName: String
    @Published var steamID:String = ""
    @Published var communityProfile: String
    @Published var last_logon: String
    @Published var last_logoff: String
    @Published var avatar: String
    @Published var state: String
    
    var stats: PlayerStats? = nil

    init(_json: [String: Any]){
        userName = _json["userName"] as? String ?? ""
        steamID = _json["steamID"] as? String ?? ""
        communityProfile = _json["communityProfile"] as? String ?? ""
        last_logon = _json["last_logon"] as? String ?? ""
        last_logoff = _json["last_logoff"] as? String ?? ""
        
        avatar = _json["avatar"] as? String ?? ""
        
        if _json["state"] as? String ?? "" == "0"{
            
            state = "offline"
            
        } else{
            state = "online"
        }
        
        DispatchQueue.main.async {
            self.stats = self.LoadStats()
        }
        
        
    }
    
    func LoadStats() -> PlayerStats{
        
        let _json = NetworkRequestService.DoGet(_url: URL(string: SteamNetwork.statsURL + "/" + (SteamNetwork.steamID ?? ""))!)
    
        return PlayerStats(_json: _json[0])
        
    }
        
    func ShowInfo(){
        print("--------------- User Info -----------------")
        
        print("userName:", userName)
        print("communityProfile:", communityProfile)
        print("last_logon:", last_logon)
        print("last_logoff:", last_logoff)
        print("state:", state)
        print("avatar:", avatar)
    }
    
    func GetAvatar() -> Image{
        
        print("GETAVATAR:", avatar)
        
        if avatar == ""{
            return Image("PROFILE")
        }
        
        if let data = try? Data(contentsOf: URL(string: avatar)!) {
                // Create Image and Update Image View
            return Image(uiImage: (UIImage(data: data) ?? UIImage(named: "PROFILE"))!)
        } else{
            return Image("PROFILE")
        }
        
    }
}
