//
//  FavouriteList.swift
//  NavigationApp
//
//  Created by Student on 2017-11-29.
//  Copyright © 2017 Centennial. All rights reserved.
//

import Foundation

class FavoriteList{
    static let sharedFavouritesList = FavoriteList()
    private(set) var favorites:[String]
    
    init() {
        let defoults = UserDefaults.standard
        let storedFavorites = defoults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    private func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    private func removeFavorite(fontName: String){
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    
}
