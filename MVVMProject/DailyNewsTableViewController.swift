//
//  ViewController.swift
//  MVVMProject
//
//  Created by Mohamed osama on 12/03/2021.
//

import UIKit

class DailyNewsTableViewController: UITableViewController {

    private var articleVM: ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }

    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = false
       
        guard let url = URL(string: "http://newsapi.org/v2/everything?q=apple&from=2021-03-11&to=2021-03-11&sortBy=popularity&apiKey=740b8a24a9b74858aba803422adbb93c") else {return}
        
        let service = Services()
        service.getArticles(url: url) { (articles) in
            if let articles = articles{
                self.articleVM = ArticleListViewModel(articlesList: articles)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleVM == nil ? 0 : self.articleVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articleVM == nil ? 0 : self.articleVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        let article = self.articleVM.getArticleAtIndex(index: indexPath.row)
        
        cell.labelTitle.text = article.title
        cell.labelDesc.text = article.description
        
        return cell
    }
    
}

