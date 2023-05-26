//
//  SteamNetwork.swift
//  Westfield
//
//  Created by Apps2M on 1/2/23.
//

import UIKit
import Combine

class SteamNetwork: NSObject {
    
    
    static let loginURL: String = "https://westfieldapirest.onrender.com/login"
    
    static let authURL: String = "https://westfieldapirest.onrender.com/authcode"
    
    static let logoutURL: String = "https://westfieldapirest.onrender.com/logout"
    
    static let userURL: String = "https://westfieldapirest.onrender.com/user"
    
    static let statsURL: String = "https://westfieldapirest.onrender.com/playerstats"
    
    static let friendsURL: String = "https://westfieldapirest.onrender.com/friends"
    

    /*static let loginURL: String = "http://127.0.0.1:5000/login"
    
    static let authURL: String = "http://127.0.0.1:5000/authcode"
    
    static let userURL: String = "http://127.0.0.1:5000/user"
    
    static let statsURL: String = "http://127.0.0.1:5000/playerstats"
    
    static let friendsURL: String = "http://127.0.0.1:5000/friends"*/
    
    static var conncetedToServer: Bool = false
    
    static var logged: Bool = false
    
    static var needAuthCode: Bool = false
    
    static var errorOcurred: Error = ErrorType.unexpected
    
    static var currentUser: SteamUser? = nil
    
    static var friendsList: [Friend] = []
    
    static var steamID: String? = nil
    
    static func SteamLogin(_userName: String, _pass: String,completion: @escaping () -> Void) async{
        
        let userParams: [String:Any] = [
            "userName": _userName,
            "pass": _pass
        ]
        
        await NetworkRequestService.DoPost(_paramsDic: userParams, _url: URL(string: loginURL)!){
            
            //            var responseRecived: Bool = false
            //
            //            responseRecived = NetworkRequestService.webResponse as! [String:String] != [:]
            //            if responseRecived {
            
            if NetworkRequestService.webResponse["steamID"] != nil{
                steamID = NetworkRequestService.webResponse["steamID"] as? String
            }
            
            CheckForError(_json: NetworkRequestService.webResponse as? [String:String] ?? ["errorType":ErrorType.unexpected.error])
            completion()
        }
//            } else{
//
//                CheckForError(_json: ["errorType":ErrorType.timeOut.error])
//
//            }
        
        
    }
    
    
    static func SendAuthCode(_codeType: String, _userName: String, _pass: String, _authCode: String,completion: @escaping  () -> Void) async{
        
        let userParams: [String:Any] = [
            "codeType": _codeType,
            "userName": _userName,
            "pass": _pass,
            "authCode": _authCode
        ]
        
        print("SendAuthCode: ", userParams)
        
        await NetworkRequestService.DoPost(_paramsDic: userParams, _url: URL(string: authURL)!){
            
            
            //            var responseRecived: Bool = false
            //
            //            responseRecived = NetworkRequestService.webResponse as! [String:String] != [:]
            //
            //            if responseRecived {
            
            if NetworkRequestService.webResponse["steamID"] != nil{
                steamID = NetworkRequestService.webResponse["steamID"] as? String
            }
            
            CheckForError(_json: NetworkRequestService.webResponse as? [String:String] ?? ["errorType":ErrorType.unexpected.error])
            completion()
        }
//
//            } else{
//
//                CheckForError(_json: ["errorType":ErrorType.timeOut.error])
//
//            }
            
        
        
    }
    
    
    static func CheckForError(_json: [String:String]){
        
        needAuthCode = false
        
        logged = false
        
        if _json["errorType"] == ErrorType.pass.error{
            
            errorOcurred = ErrorType.pass
            
        } else if _json["errorType"] == ErrorType.auth.error{
            
            errorOcurred = ErrorType.auth
            
            needAuthCode = true
            
        }else if _json["errorType"] == ErrorType.email.error{
            
            
            errorOcurred = ErrorType.email
            
            needAuthCode = true
            
        }else if _json["errorType"] == ErrorType._2fa.error{
            
            
            errorOcurred = ErrorType._2fa
            
            needAuthCode = true
            
        }else if _json["errorType"] == ErrorType.servers.error{
            
            errorOcurred = ErrorType._2fa
            
            
        }else if _json["errorType"] == ErrorType.unexpected.error{
            
            errorOcurred = ErrorType.unexpected
            
            
        }else if _json["errorType"] == "ok"{
            print("LOGGED SUCCESSFULY")
            logged = true
        }
        else{
            
            logged = false
            
        }
        
        if !logged{
            print("Error SteamNetwork:", errorOcurred.message)
        } else{
            
            DispatchQueue.main.async{
                LoadSteamUser()
                LoadFriends()
            }
            
        }
    }
    
    
    static func LoadSteamUser(){
        
        let _json = NetworkRequestService.DoGet(_url: URL(string: userURL + "/"+(steamID!))!)
        
        currentUser = SteamUser(_json: _json[0])
        
        currentUser?.ShowInfo()
        
    }
    
    static func LoadFriends(){
        
        friendsList.removeAll()
        
        let _json = NetworkRequestService.DoGet(_url: URL(string: friendsURL + "/"+(steamID!))!)
        
        print(friendsURL + "/"+(steamID ?? "none"))
        
        for f in _json {
            friendsList.append(Friend(_json: f))
        }
        
        
        
    }
    static func LogoutSteamAccount(){

            friendsList.removeAll()

            let _json = NetworkRequestService.DoGet(_url: URL(string: logoutURL + "/"+(steamID!))!)

            print(logoutURL + "/"+(steamID ?? "none"))

        }
}
