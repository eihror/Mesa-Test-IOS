//
//  HomeViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private let homeViewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var tableViewNews: UITableView!
    
    private var dataList: Array<HomeData> = Array()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleAttributes: [NSAttributedString.Key : Any] = [
            .font: Fonts.Roboto(.bold, size: 18),
            .foregroundColor: Colors.white
        ]
        
        setupToolbar(backgroundColor: Colors.stratos, isTranslucent: false, titleAttrs: titleAttributes, title: "Mesa News", isGonnaHaveLeftButton: false)
    }
    
    override func setupBinding() {
        tableViewNews.register(CustomTitleCell.nib(), forCellReuseIdentifier: CustomTitleCell.identifier)
        tableViewNews.register(CustomHighlightCollection.nib(), forCellReuseIdentifier: CustomHighlightCollection.identifier)
        tableViewNews.register(CustomNewsCell.nib(), forCellReuseIdentifier: CustomNewsCell.identifier)
        
        tableViewNews.delegate = self
        tableViewNews.dataSource = self
    }
    
    override func setupView() {
        tableViewNews.separatorColor = Colors.alto
        homeViewModel.fetchNewsAndHighlights()
    }
    
    override func setupObservable() {
        homeViewModel.onNewsFounded = { news in
            self.dataList.append(contentsOf: news)
            self.tableViewNews.reloadData()
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == dataList.count - 1 {
            homeViewModel.fetchNextPage()
        }
        
        let data: HomeData = dataList[indexPath.row]
        switch data {
        case is TitleData:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.identifier, for: indexPath) as! CustomTitleCell
            cell.configure(with: (data as! TitleData).title ?? "")
            return cell
        case is HighlightData:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomHighlightCollection.identifier, for: indexPath) as! CustomHighlightCollection
            cell.configure(with: data as! HighlightData)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomNewsCell.identifier, for: indexPath) as! CustomNewsCell
            cell.configure(with: data as! NewsData)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataList[indexPath.row] {
        case is TitleData:
            return 46.0
        case is HighlightData:
            return 144.0
        default:
            return 328.0
        }
    }
}
