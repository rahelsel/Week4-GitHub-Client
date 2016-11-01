//
//  AuthViewController.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/1/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        
        let parameters = ["scope": "user:email,repo"]
        
        GithubService.shared.oAuthWith(parameters: parameters)
        
    }

}
