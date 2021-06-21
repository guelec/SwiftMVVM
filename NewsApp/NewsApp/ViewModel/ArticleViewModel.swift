//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Yiğit Güleç on 20.06.2021.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel{
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int{
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

// responsible for viewing ONLY ONE particular article
struct ArticleViewModel {
    private let article: Article
    
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title: String {
        return self.article.title!
    }
    
    var description: String {
        if self.article.description != nil {
            return self.article.description!
        } else {
            return ""
        }
    }
}
