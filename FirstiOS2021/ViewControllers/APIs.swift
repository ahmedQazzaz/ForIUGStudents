//
//  APIs.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 21/04/2021.
//

import Foundation


enum API : String{
    
    static var basicURL : URL {
        return URL(string: "http://aaqsoftware.com/Samples")!
    }
    
    var url : URL {
        return API.basicURL.appendingPathComponent(self.rawValue)
    }
    
    case getList = "sample_get_list.php"
    case postUser = "sample_post_user.php"
        
    
}
