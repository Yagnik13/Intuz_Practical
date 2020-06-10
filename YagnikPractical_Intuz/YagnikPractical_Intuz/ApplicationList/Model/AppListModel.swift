//
//  AppListModel.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import Foundation
class AppListModel {
    var resultCount : Int?
    var results : [Results]?

    
    init() {}
    
    init(_ data:[String:Any]) {
        self.resultCount = data["resultCount"] as? Int
        self.results = data["results"] as? [Results]
    }
}

class Results {
    var screenshotUrls : [String]?
    var ipadScreenshotUrls : [String]?
    var appletvScreenshotUrls : [String]?
    var artworkUrl60 : String?
    var artworkUrl512 : String?
    var artworkUrl100 : String?
    var artistViewUrl : String?
    var supportedDevices : [String]?
    var advisories : [String]?
    var isGameCenterEnabled : Bool?
    var features : [String]?
    var kind : String?
    var trackCensoredName : String?
    var languageCodesISO2A : [String]?
    var fileSizeBytes : String?
    var sellerUrl : String?
    var contentAdvisoryRating : String?
    var averageUserRatingForCurrentVersion : Double?
    var userRatingCountForCurrentVersion : Int?
    var averageUserRating : Double?
    var trackViewUrl : String?
    var trackContentRating : String?
    var trackId : Int?
    var trackName : String?
    var releaseDate : String?
    var genreIds : [String]?
    var formattedPrice : String?
    var primaryGenreName : String?
    var isVppDeviceBasedLicensingEnabled : Bool?
    var minimumOsVersion : String?
    var sellerName : String?
    var currentVersionReleaseDate : String?
    var releaseNotes : String?
    var primaryGenreId : Int?
    var currency : String?
    var description : String?
    var artistId : Int?
    var artistName : String?
    var genres : [String]?
    var price : Double?
    var bundleId : String?
    var version : String?
    var wrapperType : String?
    var userRatingCount : Int?

    
    init() {}
    
    init(_ data:[String:Any]) {
        self.screenshotUrls = data["screenshotUrls"] as? [String]
        self.ipadScreenshotUrls = data["ipadScreenshotUrls"] as? [String]
        self.appletvScreenshotUrls = data["appletvScreenshotUrls"] as? [String]
        self.artworkUrl60 = data["artworkUrl60"] as? String
        self.artworkUrl512 = data["artworkUrl512"] as? String
        self.artworkUrl100 = data["artworkUrl100"] as? String
        self.artistViewUrl = data["artistViewUrl"] as? String
        self.supportedDevices = data["supportedDevices"] as? [String]
        self.advisories = data["advisories"] as? [String]
        self.isGameCenterEnabled = data["isGameCenterEnabled"] as? Bool
        self.features = data["features"] as? [String]
        self.kind = data["kind"] as? String
        self.trackCensoredName = data["trackCensoredName"] as? String
        self.languageCodesISO2A = data["languageCodesISO2A"] as? [String]
        self.fileSizeBytes = data["fileSizeBytes"] as? String
        self.sellerUrl = data["sellerUrl"] as? String
        self.contentAdvisoryRating = data["contentAdvisoryRating"] as? String
        self.averageUserRatingForCurrentVersion = data["averageUserRatingForCurrentVersion"] as? Double
        self.userRatingCountForCurrentVersion = data["userRatingCountForCurrentVersion"] as? Int
        self.averageUserRating = data["averageUserRating"] as? Double
        self.trackViewUrl = data["trackViewUrl"] as? String
        self.trackContentRating = data["trackContentRating"] as? String
        self.trackId = data["trackId"] as? Int
        self.trackName = data["trackName"] as? String
        self.releaseDate = data["releaseDate"] as? String
        self.genreIds = data["genreIds"] as? [String]
        self.formattedPrice = data["formattedPrice"] as? String
        self.primaryGenreName = data["primaryGenreName"] as? String
        self.isVppDeviceBasedLicensingEnabled = data["isVppDeviceBasedLicensingEnabled"] as? Bool
        self.minimumOsVersion = data["minimumOsVersion"] as? String
        self.sellerName = data["sellerName"] as? String
        self.currentVersionReleaseDate = data["currentVersionReleaseDate"] as? String
        self.releaseNotes = data["releaseNotes"] as? String
        self.primaryGenreId = data["primaryGenreId"] as? Int
        self.currency = data["currency"] as? String
        self.description = data["description"] as? String
        self.artistId = data["artistId"] as? Int
        self.artistName = data["artistName"] as? String
        self.genres = data["genres"] as? [String]
        self.price = data["price"] as? Double
        self.bundleId = data["bundleId"] as? String
        self.version = data["version"] as? String
        self.wrapperType = data["wrapperType"] as? String
        self.userRatingCount = data["userRatingCount"] as? Int
    }
}
