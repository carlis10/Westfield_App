//
//  ErrorType.swift
//  Westfield
//
//  Created by Apps2M on 8/2/23.
//

import UIKit

class ErrorType: NSObject {
    
    static var pass: Error = Error(_error: "invalidPassword", _message: "The password is wrong...")
    
    static var auth: Error = Error(_error: "invalidAuth", _message: "Invalid authentication...")
    
    static var email: Error = Error(_error: "needEmail", _message: "An authentication code was sent to your email...")
    
    static var _2fa: Error = Error(_error: "need2fa", _message: "An authentication code was sent to your mobile...")
    
    static var servers: Error = Error(_error: "serversDown", _message: "Steam servers are down... Pleas try again later.")
    
    static var unexpected: Error = Error(_error: "fail", _message: "Unexpected error... Please try again.")
    
    static var timeOut: Error = Error(_error: "timeOut", _message: "Time out with server response... Please try again.")
    
    static let errorsList: [Error] = [pass, auth, email, _2fa, servers, unexpected]
    
}
