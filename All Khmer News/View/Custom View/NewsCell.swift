//
//  NewsCell.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(article: Article) {
        newsImageView.kf.setImage(with: URL(string: article.image ?? "http://www.trimarksportswear.com/trimark/images/unavailable/IMAGE_UNAVAILABLE_2100hires.jpg"))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateLabel.text =  dateFormatter.string(from: article.createdDate)
        
        titleLabel.text = article.title
        viewCountLabel.text = "200K"
    }
    
}
