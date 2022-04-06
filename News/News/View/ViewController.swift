//
//  ViewController.swift
//  News
//
//  Created by Caner Çağrı on 5.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var newsTableViewModel : NewsTableVideModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //TableView row heights will be dynamic.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        loadData()
       
    }
    
    func loadData() {
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebService().takeNews(url: url!) { news in
            if let news = news {
                self.newsTableViewModel = NewsTableVideModel(newsList: news)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel!.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        let newsTableModel = self.newsTableViewModel?.newsAtIndexPath(indexPath.row)
        cell.headLabel.text = newsTableModel?.title
        cell.descriptionLabel.text = newsTableModel?.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

