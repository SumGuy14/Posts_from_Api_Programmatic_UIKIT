//
//  PostCellTableViewCell.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit

class PostCell: UITableViewCell {
// all components to show get initialized here
   private let postImage: UIImageView   = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle")
        return image
    }()
    private let  postTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    var postBody: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(postImage)
        contentView.addSubview(postTitle)
        contentView.addSubview(postBody)
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo:contentView.topAnchor),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postImage.widthAnchor.constraint(equalToConstant: 70),
            postImage.heightAnchor.constraint(equalToConstant: 70),
            
            postTitle.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            postBody.topAnchor.constraint(equalTo: postTitle.bottomAnchor),
            postBody.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postBody.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            postBody.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadCellData(post: Post){
        postTitle.text = post.title
        postBody.text = post.body
    }
}
