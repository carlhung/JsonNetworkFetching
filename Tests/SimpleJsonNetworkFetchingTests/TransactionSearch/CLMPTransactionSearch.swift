//
//  CLMPTransactionSearch.swift
//
//
//  Created by carlhung on 3/12/2020.
//

import Foundation

// MARK: - CLMPTransactionSearch

struct CLMPTransactionSearch: Encodable {
    var postType: String?
    var memorial: [String]?
    var keyword: String?
    var typeCodes: [String]?
    var bigestAndEstate: [String]?
    var phaseAndEstate: [String]?
    var cuntcodes: [String]?
    var primarySchoolNets: [String]?
    var schools: [String]?
    var mtrs: [String]?
    var estateUsages: [String]?
    var developers: [String]?
    var amountRange: CLMPRange?
    var intervalRange: CLMPRange?
    var nSizeRange: CLMPRange?
    var nUnitPriceRange: CLMPRange?
    var buildingAgeRange: CLMPRange?
    var startEndDateTimeRange: CLMPStartEndDateTimeRange?
    var offset: UInt?
    var size: UInt?
    var firstOrSecondHand: String?
    var transactionSource: String?
    var sort: String?
    var order: String?
    var day: String?
    var geoFilter: CLMPGeoFilter?
    var mtrDuration: Int?
    var mapLevelMappingType: String?
    var autoCompleteZoomToBottomLayer: Bool?
    var bedroomCount: [Int]?
    var floors: [String]?
    var geoNearBy: CLMPGeoNearBy?
    var bedroomCountRange: CLMPRange?

    // MARK: - CLMPRange

    struct CLMPRange: Encodable {
        var min: Int?
        var max: Int?
    }

    // MARK: - CLMPGeoFilter

    struct CLMPGeoFilter: Encodable {
        var points: [String]?
        var zoom: Int?
    }

    // MARK: - CLMPGeoNearBy

    struct CLMPGeoNearBy: Encodable {
        var latLng: String?
        var radius: Int?
    }

    // MARK: - CLMPStartEndDateTimeRange

    struct CLMPStartEndDateTimeRange: Encodable {
        var start: String?
        var end: String?
    }
}
