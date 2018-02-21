//
//  GitHubDetailViewController.swift
//  Introduction
//
//  Created by Manuel Munoz on 2/8/18.
//  Copyright © 2018 Manuel Munoz. All rights reserved.
//

import UIKit

class GithubRepoDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var githubRepo: GitHubRepo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = githubRepo?.name
    }

}
