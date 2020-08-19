//
//  CustomHighlightsCell.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 17/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class CustomHighlightCollection: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CustomHighlightCollection"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomHighlightCollection", bundle: nil)
    }
    
    func configure(with data: HighlightData) {
        self.news = data.news ?? []
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var news: Array<News> = Array()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(CustomHighlightCell.nib(), forCellWithReuseIdentifier: CustomHighlightCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHighlightCell.identifier, for: indexPath) as! CustomHighlightCell
        cell.configure(with: news[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 317, height: 128)
    }

}
