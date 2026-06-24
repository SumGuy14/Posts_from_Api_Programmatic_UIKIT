//
//  ViewController.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit

class SocialMedia: UIViewController, UITableViewDataSource,UITableViewDelegate {
    // Make Table view
    let postsTable: UITableView = {
        let table = UITableView()
        return table
    }()
    var posts: [Post] = []

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
extension SocialMedia{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.postCell.rawValue) as? PostCell
        cell?.loadCellData(post: posts[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}

