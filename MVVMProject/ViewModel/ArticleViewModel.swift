//
//  ArticleViewModel.swift
//  MVVMProject
//
//  Created by Mohamed osama on 12/03/2021.
//

import Foundation

struct ArticleViewModel{
    
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String{
        return self.article.title
    }
    
    var description: String{
        return self.article.description
    }
    
}

struct ArticleListViewModel{
    
    let articlesList: [Article]
    
    var numberOfSection: Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int{
        return self.articlesList.count
    }
    
    func getArticleAtIndex(index: Int) -> ArticleViewModel{
        
        let article = self.articlesList[index]
        return ArticleViewModel(article: article)
    }
}
