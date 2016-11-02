//
//  HomeViewController.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/1/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let customTransition = CustomTransition()

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var allRepos = [Repository](){
        didSet{
            self.TableView.reloadData()
        }
    }
    
    var filterResults = [Repository]() {
        didSet {
            self.TableView.reloadData()
        }
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableView.dataSource = self
        self.TableView.estimatedRowHeight = 50
        self.TableView.rowHeight = UITableViewAutomaticDimension
        self.TableView.delegate = self
        self.searchBar.delegate = self
        self.TableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        self.TableView.register(UINib(nibName: "RepoDetailCell", bundle: nil), forCellReuseIdentifier: RepoDetailCell.identifier)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        
        GithubService.shared.fetchRepos { (repositories) in
            if let repositories = repositories{
                
                for repository in repositories{
                self.allRepos.append(repository)
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetailViewController.identifier{
        
            if let destinationController = segue.destination as? RepoDetailViewController{
                if let index = TableView.indexPathForSelectedRow{
                destinationController.repository = allRepos[index.row]
                destinationController.transitioningDelegate = self
            }
        }
            
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        return self.customTransition
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return self.filterResults.count
        }
        return self.allRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.TableView.dequeueReusableCell(withIdentifier: "RepoDetailCell", for: indexPath) as? RepoDetailCell
        
        var currentRepo: Repository
        
        if searchBar.text != "" {
            currentRepo = filterResults[indexPath.row]
        }else {
            currentRepo = allRepos[indexPath.row]
        }
        
        cell?.nameRepoDetailLabel.text = currentRepo.name
        cell?.descriptionRepoDetailLabel.text = currentRepo.description
        
        return cell!
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased()
        filterResults = self.allRepos.filter { $0.name.lowercased().contains(text) }
        
        self.TableView.reloadData()
    }
}





