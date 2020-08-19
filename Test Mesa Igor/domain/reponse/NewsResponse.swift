//
//  News.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

struct NewsResponse: Codable {
    var pagination: PaginationResponse?
    var data: [News]?
}

struct PaginationResponse: Codable {
    var current_page: Int = 0
    var per_page: Int = 20
    var total_pages: Int = 0
    var total_items: Int = 0
}

struct News: Codable {
    var title: String?
    var description: String?
    var content: String?
    var author: String?
    var published_at: String?
    var highlight: Bool?
    var url: String?
    var image_url: String?
    
    func toNewsData() -> NewsData {
        let newsData = NewsData()
        newsData.title = title
        newsData.description = description
        newsData.content = content
        newsData.author = author
        newsData.published_at = published_at
        newsData.highlight = highlight
        newsData.url = url
        newsData.image_url = image_url
        
        return newsData
    }
}
