//
//  NetworkManager.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//
Import foundation

protocol NetworkProtocol:Sendable{
    func getDataFrom(string: String,completion: @escaping ([Post])->Void)
}
final class NetworkManager:NetworkProtocol{
    static let shared = NetworkManager()
    func getDataFrom(string: String, completion: @escaping ([Post]) -> Void) {
//        guard let serverURl =URL(string: URls.postsURL.rawValue) else{
//            print("invalid URL")
//            return
//        }
        URLSession.shared.dataTask(with: URLRequest(url: URls.postsURL.rawValue) { data, response, error in
            guard let data = data else{
                print("data is nil")
                return
            }
            do{
                let decodedData = JSONDecoder().decode([Post].self, from: data)
                print(decodedData.count)
            } catch {
                print(error)
            }
        } .resume()
    }
}
