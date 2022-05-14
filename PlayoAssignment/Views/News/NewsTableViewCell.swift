//
//  NewsTableViewCell.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell{
    static let identifier = "NewsTableViewCell"
    
    var article: Article? {
        didSet{
            titleLabel.text = article?.title
            authorLabel.text = article?.author
            descriptionLabel.text = article?.description

        }
    }
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let authorLabel : UILabel = {
         let lbl = UILabel()
         lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .light)
         lbl.textAlignment = .left
         return lbl
     }()
     
     
     private let titleLabel : UILabel = {
         let lbl = UILabel()
         lbl.textColor = .black
         lbl.font = UIFont.boldSystemFont(ofSize: 20)
         lbl.textAlignment = .left
         lbl.numberOfLines = 0
         return lbl
     }()
     
    private var descriptionLabel : UILabel =  {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 16)
         label.textAlignment = .left
         label.text = "1"
         label.textColor = .black
         return label
         
     }()
    
     
     private let image : UIImageView = {
         let imgView = UIImageView(image: UIImage(systemName: "person")!)
         imgView.clipsToBounds = true
         imgView.contentMode = .scaleToFill
         return imgView
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        setupImageConstraints()
        setupStackView()
        
    }
    
    private func setupStackView(){
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: image.rightAnchor,constant: 10)
            
        ])
    }
    
    private func setupImageConstraints(){
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            image.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            image.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
    }
    
    
    
}
