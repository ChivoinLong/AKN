//
//  DetailViewController.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/27/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsImageView.kf.setImage(with: URL(string: article.image ?? "http://www.trimarksportswear.com/trimark/images/unavailable/IMAGE_UNAVAILABLE_2100hires.jpg"))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        createdDateLabel.text =  dateFormatter.string(from: article.createdDate)
        
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
