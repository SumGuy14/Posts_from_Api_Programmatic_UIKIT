import UIKit

class SocialMedia: UIViewController, UITableViewDataSource,UITableViewDelegate {
    // Make Table view
    let postsTable: UITableView = {
        let table = UITableView()
        return table
    }()
    var viewmodel: SocialMediaViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postsTable.dataSource = self
        postsTable.delegate = self
        postsTable.register(PostCell.self, forCellReuseIdentifier: CellNames.postCell.rawValue)
        setupUI()
        viewmodel.getData {
            DispatchQueue.main.async(){
                self.postsTable.reloadData()
            }
        }
    }
}
extension SocialMedia{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.getCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.postCell.rawValue) as? PostCell
        cell?.loadCellData(post: viewmodel.getCellAt(index: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
}
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
    
}

