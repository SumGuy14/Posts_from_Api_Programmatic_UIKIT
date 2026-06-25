//
//  SocialMediaVM.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/25/26.
//
protocol SocialMediaVMProtocol: AnyObject {
    var posts: [Post]? { get }
    func getData(completionH: (() -> Void)?)
    func getCellCount() -> Int
    func getCellAt(index: Int) -> Post
}
class SocialMediaViewModel {
    
    var posts:[Post]?
    func getData(completionH: (() -> Void)?){
        NetworkManager.shared.getDataFrom(string: URls.postsURL.rawValue) { [weak self] posts in
            self?.posts = posts
            completionH?()
        }
    }
    func getCellCount() -> Int {
        return posts?.count ?? 1
    }
    func getCellAt(index: Int) -> Post {
        return posts?[index] ?? Post(userId: 0, id: 0, title: "", body: "sdfSdfvdSF")
    }
}
