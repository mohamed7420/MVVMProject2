//
//  Services.swift
//  MVVMProject
//
//  Created by Mohamed osama on 12/03/2021.
//

import Foundation

class Services{
    
    func getArticles(url: URL , completion: @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                
                print(error.localizedDescription)
                completion(nil)
            
            }else if let data = data{
                
                let decodedData = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articles = decodedData?.articles{
                    print(articles)
                    completion(articles)
                }
            }
            
        }.resume()
    }
}
