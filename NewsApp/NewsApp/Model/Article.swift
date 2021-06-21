//
//  Article.swift
//  NewsApp
//
//  Created by Yiğit Güleç on 20.06.2021.
//
import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}


