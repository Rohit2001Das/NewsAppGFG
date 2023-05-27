//
//  News.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String
    let feed: Feed
    let items: [Item]
}

// MARK: - Feed
struct Feed: Codable {
    let url: String
    let title: String
    let link: String
    let author, description: String
    let image: String
}

// MARK: - Item
struct Item: Codable {
    let title, pubDate: String
    let link, guid: String
    let author: String
    let thumbnail: String
    let description, content: String
    let enclosure: Enclosure
    let categories: [String]
}

// MARK: - Enclosure
struct Enclosure: Codable {
    let link: String
    let type: TypeEnum
    let thumbnail: String
}

enum TypeEnum: String, Codable {
    case imageJPEG = "image/jpeg"
}
