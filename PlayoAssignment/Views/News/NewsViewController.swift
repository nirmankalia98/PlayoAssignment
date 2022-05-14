//
//  ViewController.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import UIKit
import Combine
class NewsViewController: UITableViewController {
     
    var refreshView: UIRefreshControl = {
        let refControl = UIRefreshControl()
        refControl.attributedTitle = NSAttributedString(string: "fetching data...")
        return refControl
    }()
    var newsViewModel: NewsViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCombineSubs()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.rowHeight = 100
        tableView.refreshControl = refreshView
        refreshView.addTarget(self, action: #selector(refreshData), for: .valueChanged)        
    }
    
    @objc func refreshData(){
        newsViewModel.getNewsArticles()
    }
        
    func setupCombineSubs(){
        newsViewModel.$articles
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {[weak self] articles in
                self?.tableView.reloadData()
            })
            .store(in: &cancellables)
        
        newsViewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {[weak self] loadState in
                if loadState{
                    self?.refreshView.beginRefreshing()
                }else{
                    self?.refreshView.endRefreshing()
                }
            })
            .store(in: &cancellables)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell{
            cell.articleVM = newsViewModel.articles[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVM = newsViewModel.articles[indexPath.row]
        let vc = ArticleViewController()
        if let url = URL(string: articleVM.article.url){
            vc.url = url
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    deinit{
        cancellables.forEach{$0.cancel()}
    }

}

