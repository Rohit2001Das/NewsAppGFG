//
//  NewsTableViewCell.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var NewsBackgroundView: UIView!
    @IBOutlet weak var NewsTitleLabel: UILabel!
    @IBOutlet weak var NewsImageView: UIImageView!
    @IBOutlet weak var NewsDescriptionLabel: UILabel!
    @IBOutlet weak var publicationdateLabel: UILabel!
    var item : Item? {
        didSet { //property observer
            itemDetailConfiguration()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func itemDetailConfiguration(){
        guard let item else {return}
        NewsTitleLabel.text = item.title
        NewsDescriptionLabel.text = item.description
        publicationdateLabel.text = item.pubDate
        NewsImageView.setImage(with: item.thumbnail)
    }
    
}
