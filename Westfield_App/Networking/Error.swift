//
//  Error.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import UIKit

class Error: NSObject {
    
    var error: String
    var message: String
    
    init(_error: String, _message: String) {
        
        self.error = _error
        
        self.message = _message
        
    }
    
}
