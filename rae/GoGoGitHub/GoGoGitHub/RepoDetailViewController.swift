//
//  RepoDetailViewController.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/2/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
    
    @IBOutlet weak var nameRepoDetailLabel: UILabel!
    @IBOutlet weak var descriptionRepoDetail: UILabel!
    @IBOutlet weak var languageRepoDetailLabel: UILabel!
    @IBOutlet weak var createdAtRepoDetailLabel: UILabel!
    @IBOutlet weak var openIssuesRepoDetailLabel: UILabel!
    
    var repository: Repository? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushRepoDetails()
    }
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func pushRepoDetails(){
        
        if let repository = repository{
        
        nameRepoDetailLabel.text = repository.name
        descriptionRepoDetail.text = repository.description
        languageRepoDetailLabel.text = repository.language
        createdAtRepoDetailLabel.text = repository.created_at
        
        if repository.has_issues != nil{
            openIssuesRepoDetailLabel.text = repository.has_issues! ? "Yes" : "No"
            
            }
        }
    }

}
