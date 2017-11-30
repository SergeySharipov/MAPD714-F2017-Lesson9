//
//  FavouriteList.swift
//  NavigationApp
//
//  Created by Student on 2017-11-29.
//  Copyright © 2017 Centennial. All rights reserved.
//

import Foundation

class FavouritesList{
    static let sharedFavouritesList = FavouritesList()
    private(set) var favourites:[String]
    
    init() {
        let defoults = UserDefaults.standard
        let storedFavorites = defoults.object(forKey: "favorites") as? [String]
        favourites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    private func saveFavourites(){
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favorites")
        defaults.synchronize()
    }
    
    private func removeFavorite(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    
}
