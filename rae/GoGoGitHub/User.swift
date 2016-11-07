//
//  User.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/3/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import Foundation

class User{

    let login: String
    let webUrl: String
    
    let avatarUrl: String?
    
    init?(json: [String: Any]){
    
        if let login = json["login"] as? String, let webUrl = json["html_url"] as? String{
        
            self.login = login
            self.webUrl = webUrl
            self.avatarUrl = json["avatar_url"] as? String
        
        } else {
            return nil
        }
    }

}





