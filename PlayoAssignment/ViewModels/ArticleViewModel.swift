//
//  ArticleViewModel.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation
import UIKit
import Combine
class ArticleViewModel:ObservableObject{
    @Published var image: UIImage = UIImage(systemName: "list.bullet.rectangle.portrait")!
    let article: Article
    private var cancellable = Set<AnyCancellable>()
    private var didFetchImage = false
    
    init(_article: Article) {
        article = _article
    }
    
    func getImage(){
        guard !didFetchImage,let url = URL(string: article.urlToImage) else{return}
        NetworkService.shared.fetchData(url: url, completion: {[weak self] imageData in
            if let imageData = imageData,let image = UIImage(data: imageData) {
                    self?.image = image
                self?.didFetchImage = true
            }
        })
            
    }
    
}
