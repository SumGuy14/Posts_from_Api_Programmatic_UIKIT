//
//  Helper.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//
import UIKit
extension SocialMedia {
    func setupUI(){
        view.addSubview(postsTable)
        postsTable.rowHeight = UITableView.automaticDimension
        postsTable.estimatedRowHeight = 200
        postsTable.translatesAutoresizingMaskIntoConstraints = false
        postsTable.register(PostCell.self, forCellReuseIdentifier: CellNames.postCell.rawValue)
        NSLayoutConstraint.activate([
            postsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTable.topAnchor.constraint(equalTo: view.topAnchor),
            postsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    func getData(){
        NetworkManager.shared.getDataFrom(string: URls.postsURL.rawValue) { [weak self] posts in
            self?.posts = posts
            DispatchQueue.main.async(){
                self?.postsTable.reloadData()
            }
        }
    }
}
