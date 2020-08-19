//
//  HomeUseCase.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver

class HomeUseCase {
    
    @Injected private var repository: NewsRepository
    
    func fetchHighlights() throws -> [News] {
        try repository.fetchHighlights()
    }
    
    func fetchNews(_ restart: Bool = false) throws -> [News] {
        try repository.fetchNews(restart)
    }
}
