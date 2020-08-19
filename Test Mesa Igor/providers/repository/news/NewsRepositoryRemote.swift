//
//  NewsRepositoryRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Resolver

class NewsRepositoryRemote: NewsRepository {
        
    @Injected private var dataSource: NewsDataSource
    
    func fetchHighlights() throws -> [News] {
        return try dataSource.fetchHighlights()
    }
    
    func fetchNews(_ restart: Bool?) throws -> [News] {
        return try dataSource.fetchNews(restart)
    }
    
}
