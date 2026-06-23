//
//  PostCellTableViewCell.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit

class PostCell: UITableViewCell {
// all components to show get initialized here
    let image:UIImage = {
       let image = UIImage(systemName: <#T##String#>)
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
        contentView.addSubview(<#T##view: UIView##UIView#>)
        NSLayoutConstraint.activate([
            
        ])
    }
    

}
