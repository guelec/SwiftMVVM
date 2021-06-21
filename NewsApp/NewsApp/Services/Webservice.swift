//
//  Webservice.swift
//  NewsApp
//
//  Created by Yiğit Güleç on 20.06.2021.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completionHandler: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    print("hi")
                    completionHandler(articleList.articles)
                }
                
                //print(articleList?.articles)
                
            }
            
        }.resume()
        
    }
    
}
