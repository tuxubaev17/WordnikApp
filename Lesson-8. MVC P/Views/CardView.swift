//
//  CardView.swift
//  Lesson-8. MVC P
//
//  Created by Alikhan Tuxubayev on 15.02.2021.
//

import UIKit

final class CardView: UIView {

    lazy var textLabel: UILabel = {
       let text = UILabel()
       return text
    
    }()
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        setupViews()
        setStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(_ text: String){
        self.textLabel.text = text
    }
    
    private func setupViews(){
        self.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    
        }
    
    private func setStyles(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.init(width: 5, height: 5)
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
       
        
    }

}
