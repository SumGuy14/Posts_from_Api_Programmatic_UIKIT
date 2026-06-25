//
//  NetworkManager.swift
//  Posts from Api Programmatic UIKIT
//
//  Created by Sumedh Kulkarni on 6/23/26.
//
import Foundation

protocol NetworkProtocol:Sendable{
    func getDataFrom(string: String,completion: @escaping ([Post])->Void)
}
final class NetworkManager:NetworkProtocol{
    static let shared = NetworkManager()
    private init(){}
    func getDataFrom(string: String, completion: @escaping ([Post]) -> Void) {
        guard let serverURL = URL(string: URls.postsURL.rawValue) else{
            print("invalid URL")
            return
        }
        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest ) { data, response, error in
            guard let data = data else{
                print("data is nil")
                return
            }
            do{
                let decodedData = try JSONDecoder().decode([Post].self, from: data)
                print(decodedData.count)
                completion(decodedData)
            } catch {
                print(error)
            }
        } .resume()
    }
}
