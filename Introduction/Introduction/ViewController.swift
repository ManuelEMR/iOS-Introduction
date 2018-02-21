//
//  ViewController.swift
//  Introduction
//
//  Created by Manuel Munoz on 2/8/18.
//  Copyright © 2018 Manuel Munoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var staticDataArray = [String]()
    var githubRepos = [GitHubRepo]()
    let requestManager = RequestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillArray()
        self.requestManager.requestPublicGithubRepos() { data in
            if let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                self.githubRepos = json.flatMap { GitHubRepo(json: $0) }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func fillArray() {
        
        for i in 1...20 {
            staticDataArray.append("Cell number: \(i)")
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubRepos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellIdentifier", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = githubRepos[indexPath.row].fullName
        return cell
    }
    
    
    // MARK: Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRepo = githubRepos[indexPath.row]
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "GithubRepoDetailViewController")
        guard let viewController = detailViewController as? GithubRepoDetailViewController else { return }
        
        viewController.githubRepo = selectedRepo
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

