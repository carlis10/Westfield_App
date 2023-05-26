//
//  NetworkRequestService.swift
//  MySchedule
//
//  Created by Apps2M on 19/1/23.
//

import UIKit
import Alamofire
import Foundation

struct UserParams: Encodable {
    var userName: String
    var pass: String
    
}

struct UserParamsAuth: Encodable {
    var codeType: String
    var userName: String
    var pass: String
    var authCode: String
    
}

class NetworkRequestService: NSObject {
    
    static var loged: Bool = false
    
    static var webResponse: [String: Any] = [:]
    
    static func DoPost(_paramsDic: [String: Any], _url: URL,completion:@escaping () -> Void) async {
        
        webResponse = [:]
        
        var _userParams: UserParams = UserParams(userName: "", pass: "")
        
        var _userParamsAuth: UserParamsAuth = UserParamsAuth(codeType: "", userName: "", pass: "", authCode: "")
        
        var isAuth: Bool = false
        
        if _paramsDic.count > 2{
            print("paramsDic: ", _paramsDic)
            
            isAuth = true
            
            _userParamsAuth = UserParamsAuth(codeType: _paramsDic["codeType"] as! String, userName: _paramsDic["userName"] as! String, pass: _paramsDic["pass"] as! String, authCode: _paramsDic["authCode"] as! String)
            
        } else{
            print("paramsDic: ", _paramsDic)
            
            isAuth = false
            
            _userParams = UserParams(userName: _paramsDic["userName"] as! String, pass: _paramsDic["pass"] as! String)
        }
          
        
        
        await SendRequest(userParams: _userParams, userParamsAuth: _userParamsAuth, _url: _url, auth: isAuth,completion: completion)
    }
    
    static func SendRequest(userParams: UserParams, userParamsAuth: UserParamsAuth, _url: URL, auth: Bool,completion:@escaping () -> Void) async{
        
        var tempJson: [String:Any] = [:]
        
        if auth{

               
          AF.request(_url,
                       method: .post,
                       parameters: userParamsAuth,
                       encoder: JSONParameterEncoder.default).response { response in
                
                
              let data = response.data

                do {
                    
                    tempJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                    
                } catch let errorJson {
                    
                    tempJson = ["errorType": ErrorType.unexpected.error]
                    
                    print(errorJson)
                }
                
                webResponse = tempJson
                
                print("TEMP JSON:", webResponse["errorType"] ?? "error type not finded")
                completion()
            
            }
        } else{
                
              AF.request(_url,
                           method: .post,
                           parameters: userParams,
                           encoder: JSONParameterEncoder.default).response { response in
                    
                    var data = response.data
                  
                    do {
                        data = try Data(contentsOf: _url)
                    } catch {
                        print("Error was ocurred")
                    }
                    
                    if data == nil{
                        
                        tempJson = ["errorType": ErrorType.unexpected.error]
                        
                        webResponse = tempJson
                        
                        return
                    }
                    
                    do {
                        
                        tempJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                        
                    } catch let errorJson {
                        
                        tempJson = ["errorType": ErrorType.unexpected.error]
                        
                        print(errorJson)
                    }
                    
                    webResponse = tempJson
                    
                    print("TEMP JSON:", webResponse["errorType"] ?? "error type not finded")
//                  DispatchQueue.main.async {
                      completion()
//                  }
                }
                
            }
    }
    
    static func DoGet(_url: URL) -> [[String:AnyObject]]{
        
        var data = Data()
        
        var tempJsonList: [[String:AnyObject]] = [[:]]
        
        do {
            data = try Data(contentsOf: _url)
        } catch {
            print("Error has ocurred")
        }
        
        do {
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            tempJsonList = json as! [[String:AnyObject]]
            
            
        } catch let errorJson {
            print(errorJson)
        }
        
        return tempJsonList
    
    }
    
    
}





