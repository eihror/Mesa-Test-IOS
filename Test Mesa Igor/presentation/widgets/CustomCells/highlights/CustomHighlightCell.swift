//
//  CustomHighlightCell.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 18/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class CustomHighlightCell: UICollectionViewCell {

   static let identifier = "CustomHighlightCell"
        
    static func nib() -> UINib {
        return UINib(nibName: "CustomHighlightCell", bundle: nil)
    }
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with news: News) {
        self.newsTitle.text = news.title
        
        if let urlImage: String = news.image_url {
            ImageUtil().getImage(urlImage) { image in
                self.newsImage.image = image
            }
        }
    }
}
