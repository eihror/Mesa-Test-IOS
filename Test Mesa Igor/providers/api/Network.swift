//
//  Network.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 07/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import Alamofire
import SwiftCoroutine
import Resolver

class Network: BaseDataSource {
    
    @Injected private var userRepository: UserRepository
        
    func request(
            service: Endpoint,
            parameters: [String: Any]? = nil,
            headers: HTTPHeaders? = nil
    ) -> CoFuture<(code: Int?, result: Data?,  error: NSError?)> {
        
        let promise = CoPromise<(code: Int?, result: Data?,  error: NSError?)>()
        
        let baseUrl = Constants.baseUrl
        
        var header: HTTPHeaders = headers ?? [:]
        
        header["Content-Type"] = "application/json"
        
        let accessToken = userRepository.getAccessToken()
        
        if let token = accessToken {
            header["Authorization"] = token
        }
        
        let encodedUrl: String?
        if service.hasCustomUrl {
            encodedUrl = service.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        } else {
            encodedUrl = (baseUrl + service.path).addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        }
        
        Network.consoleHTTPRequest(url: encodedUrl ?? "", parameters: parameters, headers: header)
        
        let request = Alamofire.request(encodedUrl ?? "",
                                 method: service.method,
                                 parameters: parameters,
                                 encoding: service.encoding,
                                 headers: header)
    
        request.responseJSON { response in
            print(response.response?.statusCode ?? "")
            switch response.result {
            case .success(let jsonData) :
                let entries = jsonData as AnyObject?
                Network.consoleHTTPResponse(code: response.response?.statusCode, json: entries)
                promise.success((response.response?.statusCode, response.data, nil))
            case .failure(let error):
                Network.consoleHTTPError(error: error as NSError)
                promise.success((HTTPResponseCode.disconnected, nil, error as NSError?))
            }
        }
        
        return promise
    }
}

extension Network {
    static fileprivate func consoleHTTPRequest(url: String, parameters: Any?, headers: Any?) {
        print("\n\n------------------------------------------------------------")
        print("URL: \(url) \n")
        if let headers = headers {
            print("Headers: \(headers) \n")
        } else {
            print("Headers: nil \n")
        }
        if let parameters = parameters {
            print("Parameters: \(parameters) \n")
        } else {
            print("Parameters: nil \n")
        }
        print("------------------------------------------------------------\n\n")
    }
    
    static fileprivate func consoleHTTPResponse(code: Int?, json: AnyObject?) {
        print("\n\n------------------------------------------------------------")
        if let code = code {
            print("statusCode: \(code) \n")
        } else {
            print("statusCode:\n")
        }
        if let json = json {
            print("JSON: \(json)")
        } else {
            print("JSON:")
        }
        print("------------------------------------------------------------\n\n")
    }
    
    static fileprivate func consoleHTTPError(error: NSError?) {
        if let error = error {
            print("\n\n------------------------------------------------------------")
            print("ERROR:  \(error) \n")
            print("------------------------------------------------------------\n\n")
        }
    }
}
