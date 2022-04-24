//
//  Movie.swift
//  Netflix Clone
//
//  Created by srte on 23-04-22.
//

import Foundation

struct TitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let release_date: String?
    let vote_count: Int
    let vote_average: Double
}
