//
//  NewsViewModel.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation


class NewsViewModel: ObservableObject{
    @Published var isLoading = true
    @Published var articles: [Article] = []
    private let newsUrlString = Constants.baseUrl + Constants.apiKey
    
    init(){
        getNewsArticles()
    }
    
    func getNewsArticles(){
        isLoading = true
        guard let url = URL(string: newsUrlString) else {
            print(#file,#function,#line,"bad url format")
            return
        }
        NetworkService.shared.fetchData(type: Result.self, url: url, completion: {[weak self] res in
            guard let res = res else {return}
            
            self?.articles = res.articles
            self?.isLoading = false
            
        })
    }
    
}
