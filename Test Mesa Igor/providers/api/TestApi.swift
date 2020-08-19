//
//  TestApi.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 07/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Alamofire
import Resolver

protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var hasCustomUrl: Bool { get }
    var encoding: ParameterEncoding { get }
}

enum TestApi: Endpoint {
    
    case signIn
    case signUp
    case news(currentPage: String?, perPage: String?, publishedAt: String?)
    case highlights
    
    var method: HTTPMethod {
        switch self {
        case .signIn,
             .signUp:
            return .post
        case .news,
             .highlights:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "v1/client/auth/signin"
        case .signUp:
            return "v1/client/auth/signup"
        case .news(let currentPage, let perPage, let publishedAt):
            var url: String = "v1/client/news?"
            if let currentPage = currentPage {
                url += "current_page=\(currentPage)&"
            }
            if let perPage = perPage {
                url += "per_page=\(perPage)&"
            }
            if let publishedAt = publishedAt {
                url += "published_at=\(publishedAt)"
            }
            return url
        case .highlights:
            return "v1/client/news/highlights"
        }
    }
    
    var hasCustomUrl: Bool {
        switch self {
        default:
            return false
        }
    }
    
    var encoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
