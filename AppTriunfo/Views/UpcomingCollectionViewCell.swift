//
//  UpcomingCollectionViewCell.swift
//  AppTriunfo
//
//  Created by Raphael on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
 
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage){
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
}
