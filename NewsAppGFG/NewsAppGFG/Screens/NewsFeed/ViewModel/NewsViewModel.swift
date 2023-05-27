//
//  NewsViewModel.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import Foundation

final class NewsViewModel {
    var items : [Item] = []
    var eventHandler :( (_ event:Event)-> Void)? //data binding closure
    
    func fetchNews(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchNews { response in
            self.eventHandler?(.stopLoading)
            switch response{
            case .success(let news):
                self.items = news.items
                self.eventHandler?(.dataLoaded)
               
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}
extension NewsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
