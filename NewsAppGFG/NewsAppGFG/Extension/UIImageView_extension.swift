//
//  UIImageView_extension.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
        
    }
}
