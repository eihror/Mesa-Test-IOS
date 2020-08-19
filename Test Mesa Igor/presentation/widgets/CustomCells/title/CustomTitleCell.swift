//
//  CustomTitleCell.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 18/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class CustomTitleCell: UITableViewCell {
    
    static let identifier = "CustomTitleCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTitleCell", bundle: nil)
    }
    
    @IBOutlet weak var title: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with data: String) {
        title.text = data
    }
    
}
