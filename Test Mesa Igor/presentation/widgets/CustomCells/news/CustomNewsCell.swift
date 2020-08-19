//
//  CustomNewsCell.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 17/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class CustomNewsCell: UITableViewCell{
    static let identifier = "CustomNewsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomNewsCell", bundle: nil)
    }
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with data: NewsData) {
        newsTitle.text = data.title
        newsDescription.text = data.description
        
        if let urlImage: String = data.image_url {
            ImageUtil().getImage(urlImage) { image in
                self.newsImage.image = image
            }
        }
        
    }
}
