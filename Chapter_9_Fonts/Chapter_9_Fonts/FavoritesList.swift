//
//  FavoritesList.swift
//  Chapter_9_Fonts
//
//  Created by Wei Li on 21/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList {
    
    class var sharedFavoriteList : FavoritesList {
        struct Singleton {
            static let instance = FavoritesList()
        }
        return Singleton.instance;
    }
    
    private(set) var favorites:[String]
    
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedFavorites = defaults.objectForKey("favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if (!favorites.contains(fontName)) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String) {
        if let index = favorites.indexOf(fontName) {
            favorites.removeAtIndex(index)
            saveFavorites()
        }
    }
    
    private func saveFavorites() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}