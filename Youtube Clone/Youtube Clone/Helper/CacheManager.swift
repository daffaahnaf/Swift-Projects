//
//  ChaceManager.swift
//  Youtube Clone
//
//  Created by daffa ahnaf on 25/03/21.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store image
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //Try to get data
        return cache[url]
    }
    
    
}
