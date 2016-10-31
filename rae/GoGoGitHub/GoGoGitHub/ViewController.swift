//
//  ViewController.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 10/31/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestTokenPressed(_ sender: AnyObject) {
        
        let parameters = ["scope":"user:email,repo"]
        
        GithubService.shared.oAuthWith(parameters: parameters)
        
    }

    @IBAction func printTokenPressed(_ sender: AnyObject) {
        
        if let token = UserDefaults.standard.getAccessToken(){
            print("YOUR TOKEN IS: \(token).")
            
        }else{
        
            print("TOKEN NOT FOUND.")
        }
        
        }
        
    }


