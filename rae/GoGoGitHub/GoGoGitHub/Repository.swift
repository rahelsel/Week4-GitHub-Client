//
//  Repository.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/1/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import Foundation

class Repository{

    let name: String
    let description: String?
    let language: String?
    let created_at: String?
    let has_issues: Bool?
    
    init? (json: [String: Any]){
        if let name = json["name"] as? String{
            self.name = name
            self.description = json["description"] as? String
            self.language = json["language"] as? String
            self.created_at = json["created_at"] as? String
            self.has_issues = json["has_issues"] as? Bool
            
        } else {
            return nil
        }
    
    }

}
