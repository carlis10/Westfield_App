
import Foundation
import SwiftUI

class Friend: ObservableObject, Identifiable{
    
    @Published var userName:String = ""
    @Published var steamID:String = ""
    @Published var relationship: String = ""
    @Published var avatarURL: String = ""
    @Published var state: String = ""
    
    @Published var avatarImage: UIImage? = nil
    
    init(_json: [String: Any]){
        userName = _json["userName"] as? String ?? ""
        steamID = _json["steamID"] as? String ?? ""
        relationship = _json["relationship"] as? String ?? ""
        avatarURL = _json["userAvatar"] as? String ?? ""
        
        if _json["state"] as? String ?? "" == "0"{
            
            state = "offline"
            
        } else{
            state = "online"
        }
        
        avatarImage = GetAvatarFromURL(_avatarURL: avatarURL)
    }
    
    func GetAvatarFromURL(_avatarURL: String) -> UIImage{
        
        if _avatarURL == ""{
            return UIImage(named: "PROFILE")!
        }

        if let data = try? Data(contentsOf: URL(string: _avatarURL)!) {
                // Create Image and Update Image View
            return UIImage(data: data) ?? UIImage(named: "PROFILE")!
        } else{
            return UIImage(named: "PROFILE")!
        }
        
    }
    
}
