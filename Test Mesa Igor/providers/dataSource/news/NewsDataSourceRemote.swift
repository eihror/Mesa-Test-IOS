//
//  NewsDataSourceRemote.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Resolver

class NewsDataSourceRemote: BaseDataSource, NewsDataSource {
    
    @Injected private var network: Network
    
    private var pagination: PaginationResponse = PaginationResponse()
    
    private func setupPagination(_ value: PaginationResponse) {
        pagination = value
    }
    
    private func restartPagination() {
        pagination = PaginationResponse()
    }
        
    func fetchHighlights() throws -> [News] {
        let dataInFuture = try network.request(service: TestApi.highlights).await()
        
        let result = try self.treatResponse(code: dataInFuture.code, data: dataInFuture.result, error: dataInFuture.error, type: NewsResponse.self)
        
        return result?.data ?? []
    }
    
    func fetchNews(_ restart: Bool?) throws -> [News] {
        
        var result: NewsResponse?
        var news: [News]?
        
        if restart != nil && restart! {
            restartPagination()
        }
        
        let nextPage = pagination.current_page != 0 ? pagination.current_page + 1 : 1
        
        if nextPage == 1 || nextPage <= pagination.total_pages {
            let dataInFuture = try network.request(service: TestApi.news(currentPage: String(nextPage), perPage: String(pagination.per_page), publishedAt: nil)).await()
            
            result = try self.treatResponse(code: dataInFuture.code, data: dataInFuture.result, error: dataInFuture.error, type: NewsResponse.self)
            
            if let pagination = result?.pagination {
                setupPagination(pagination)
            }
            
            news = result?.data
        } else {
            // throws pagination exception
        }
        
        return news ?? []
    }
        
}
