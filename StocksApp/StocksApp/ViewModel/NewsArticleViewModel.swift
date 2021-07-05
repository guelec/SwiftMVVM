//
//  NewsArticleViewModel.swift
//  StocksApp
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
