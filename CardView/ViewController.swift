//
//  ViewController.swift
//  CardView
//
//  Created by Khaled Elshamy on 6/6/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    let cards: [UIImage] = [#imageLiteral(resourceName: "Killua"),#imageLiteral(resourceName: "Shingeki-no-Kyojin-protocoloxp"),#imageLiteral(resourceName: "4a50e93c205e7f14ea5385fb792d1e49"),#imageLiteral(resourceName: "liawliet")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDummyCards()
    }
    
    
    fileprivate func setupDummyCards(){
        cards.forEach { (image) in
            let cardsDeckView = CardView(image: image)
            self.view.addSubview(cardsDeckView)
            cardsDeckView.anchor(top:view.safeAreaLayoutGuide.topAnchor,leading: view.leadingAnchor,bottom: view.bottomAnchor,trailing: view.trailingAnchor,paddingTop: 100,paddingLeft: 17,paddingBottom: 100,paddingRight: 17)
        }
    }
    
    
    func setupViews(){
        
        
    }

}

