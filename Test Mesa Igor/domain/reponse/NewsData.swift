//
//  NewsData.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 18/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

class HomeData: Codable {}

class TitleData: HomeData {
    var title: String?
}

class HighlightData: HomeData {
    var news: Array<News>?
}

class NewsData: HomeData {
    var title: String?
    var description: String?
    var content: String?
    var author: String?
    var published_at: String?
    var highlight: Bool?
    var url: String?
    var image_url: String?
}
