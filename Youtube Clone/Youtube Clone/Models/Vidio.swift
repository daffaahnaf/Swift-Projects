//
//  Vidio.swift
//  Youtube Clone
//
//  Created by daffa ahnaf on 19/03/21.
//

import Foundation

struct Video : Decodable{
    var videoid = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    //Wadah
    enum CodingKeys : String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAT"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    //penjabaran
    init (from decoder: Decoder) throws {
    let container = try
    decoder.container(keyedBy: CodingKeys.self)

    let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)

    //Parse Title
    self.title = try snippetContainer.decode(String.self, forKey: .title)
    //Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description
        )
    //Parse publish
    self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try
            snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        let highContainer = try
            thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse Vidio id
        let resourceIdContainer = try
            snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoid = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
