//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Yiğit Güleç on 20.06.2021.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    var index: Int = 0
    var article: ArticleViewModel? {
        didSet{
            guard let article = article else {return}
            titleLabel.text = article.title
            descriptionLabel.text = article.description
        }
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0 // to enable multiple lines
        label.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0 // to enable multiple lines
        label.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        return label
    }()
    
    let stackView:UIStackView = {
            let view = UIStackView()
        view.axis = .vertical
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true // this will make sure its children do not go out of the boundary
            return view
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        stackView.addSubview(titleLabel)
        stackView.addSubview(descriptionLabel)
        
        
        titleLabel.anchor(top: stackView.topAnchor, left: leftAnchor, bottom: descriptionLabel.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: frame.width, height: 0, enableInsets: false)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: stackView.leftAnchor, bottom: stackView.bottomAnchor, right: stackView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: frame.width, height: 0, enableInsets: false)
        
        
        
        stackView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        //stackView.heightAnchor.constraint(equalToConstant:70).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
