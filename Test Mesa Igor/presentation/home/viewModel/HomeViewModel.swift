//
//  HomeViewModel.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    private var useCase = HomeUseCase()
    
    var onNewsFounded: (([HomeData]) -> Void)?
    
    func fetchNewsAndHighlights() {
        queue.startCoroutine(in: scope) {
            do {
                let hightlights = try self.useCase.fetchHighlights()
                let news = try self.useCase.fetchNews()
                
                var data: Array<HomeData> = Array()
                
                let highlightTitle = TitleData()
                highlightTitle.title = "home_screen_highlight_title".localizable
                
                let newsTitle = TitleData()
                newsTitle.title = "home_screen_news_title".localizable
                
                let highlightData = HighlightData()
                
                data.append(highlightTitle)
                
                highlightData.news = hightlights
                data.append(highlightData)
                
                data.append(newsTitle)
                
                news.forEach { item in
                    data.append(item.toNewsData())
                }
                
                self.onNewsFounded?(data)
                
            } catch let error as Errors {
                print(error)
                self.onLoading?(false)
                self.onErrorMessage?(error.getFeedbackMessage())
            }
        }
    }
    
    func fetchNextPage() {
        queue.startCoroutine(in: scope) {
            do {
                let news = try self.useCase.fetchNews()
                var data: Array<HomeData> = Array()
                news.forEach { item in
                    data.append(item.toNewsData())
                }
                
                self.onNewsFounded?(data)
            } catch let error as Errors {
                self.onLoading?(false)
                self.onErrorMessage?(error.getFeedbackMessage())
            }
        }
    }
    
}
