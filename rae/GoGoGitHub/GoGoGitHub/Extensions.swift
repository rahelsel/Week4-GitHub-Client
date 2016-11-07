//
//  Extensions.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 10/31/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit


extension String{

    var isValid: Bool{
    
        let regexPattern = "[^0-9a-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
            
            let range = NSRange(location: 0, length: self.characters.count)
            let matches = regex.numberOfMatches(in: self, options: .reportCompletion, range: range)
            
            if matches > 0 {
                return false
        }
            
        }catch{
            return false
            }
            return true
    }
}


extension UIResponder{

    static var identifier: String{
        return String(describing: self)
    }

}


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
