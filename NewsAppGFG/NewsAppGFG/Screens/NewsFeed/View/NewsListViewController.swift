//
//  NewsListViewController.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet weak var NewsTableView : UITableView!
    var pullControl = UIRefreshControl()
    private var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           adjustContentInset()
       }
}
    extension NewsListViewController {
        
        func configuration(){
            NewsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
            NewsTableView.refreshControl = pullControl
            pullControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            initViewModel()
            observeEvent()
            
        }       
        func adjustContentInset() {
                let topInset = pullControl.isRefreshing ? pullControl.frame.height : 0
                NewsTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            }
        @objc func refreshData() {
              viewModel.fetchNews()
          }
        func initViewModel(){
            viewModel.fetchNews()
        }
        func observeEvent(){
            viewModel.eventHandler = { [weak self] event in
                guard let self else {return}
                
                switch event {
                    case .loading:
                    //show indicator
                    print("Data Loading...")
                    case .stopLoading:
                    //hiding indicator
                    DispatchQueue.main.async {
                        self.pullControl.endRefreshing()
                        }
                    print("stop Loading...")
                    case .dataLoaded:
                    print("Data loaded...")
                    DispatchQueue.main.async {
                        self.NewsTableView.reloadData()
                    }
                    
                    case .error(let error):
                    print(error!)
             
                }
            }
        }
    }
  

extension NewsListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let item = viewModel.items[indexPath.row]
        cell.item = item
        
        return cell
    }  
}



