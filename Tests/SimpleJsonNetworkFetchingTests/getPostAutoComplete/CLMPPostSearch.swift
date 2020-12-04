//
//  File.swift
//
//
//  Created by carlhung on 3/12/2020.
//

struct CLMPPostSearch: Encodable {
    var keyword: String?
    var typeCodes: [String]?
    var bigestAndEstate: [String]?
    var phaseAndEstate: [String]?
    var postType: String?
    var isHos: Bool?
    var refNos: [String]?
    var primarySchoolNets: [String]?
    var schools: [String]?
    var mtrs: [String]?
    var estateUsages: [String]?
    var developers: [String]?
    var nSizeRange: Range?
    var amountRange: Range?
    var bedroomCountRange: Range?
    var buildingAgeRange: Range?
    var nUnitPriceRange: Range?
    var topics: [String]?
    var views: [String]?
    var chars: [String]?
    var facilities: [String]?
    var layouts: [String]?
    var floors: [String]?
    var bedroomCount: [Int]?
    var agentNo: String?
    var costCtr: String?
    var geoNearBy: GeoNearBy?
    var geoFilter: GeoFilter?
    var mtrDuration: Int?
    var offset: Int?
    var size: Int?
    var market: String?
    var hmas: [String]?
    var sort: String?
    var order: String?
    var mapLevelMappingType: String?
    var autoCompleteZoomToBottomLayer: Bool?

    // MARK: - Range

    struct Range: Encodable {
        var min: Int?
        var max: Int?
    }

    // MARK: - GeoFilter

    struct GeoFilter: Encodable {
        var points: [String]?
        var zoom: Int?
    }

    // MARK: - GeoNearBy

    struct GeoNearBy: Encodable {
        var latLng: String?
        var radius: Int?
    }
}
