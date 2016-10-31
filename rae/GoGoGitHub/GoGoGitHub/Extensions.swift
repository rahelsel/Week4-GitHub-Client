//
//  Extensions.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 10/31/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    func getAccessToken() -> String?{
    
        let accessToken = self.string(forKey: "access_token")
        
        return accessToken
    
    }

    func save(accessToken: String) -> Bool{
    
        self.set(accessToken, forKey: "access_token")
        
        return synchronize()
    
    }

}
