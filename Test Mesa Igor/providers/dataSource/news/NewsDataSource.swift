//
//  NewsDataSource.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation

protocol NewsDataSource {
    func fetchHighlights() throws -> [News]
    func fetchNews(_ restart: Bool?) throws -> [News]
}
