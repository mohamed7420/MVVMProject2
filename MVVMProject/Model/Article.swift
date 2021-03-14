//
//  Article.swift
//  MVVMProject
//
//  Created by Mohamed osama on 12/03/2021.
//

import Foundation

struct Article: Decodable{
    
    let author: String
    let title: String
    let description: String
}

struct ArticleList: Decodable{
    
    let articles: [Article]
}
