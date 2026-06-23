//
//  ViewController.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit

class SocialMedia: UIViewController {
    // Make Table view
    let postsTable: UITableView = {
        let table = UITableView()
        return table
    }()
    let posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        getData()
        postsTable.dataSource = self
        postsTable.delegate = self
        postsTable.register(PostCell.self, forCellReuseIdentifier: CellNames.postCell.rawValue)
    }
}

