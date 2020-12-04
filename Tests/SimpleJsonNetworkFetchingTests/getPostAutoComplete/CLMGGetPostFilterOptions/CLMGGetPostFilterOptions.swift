/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

 */

import Foundation
struct CLMGGetPostFilterOptions: Codable {
    let district: [District]?
    let estate: [Estate]?
    let school: [School]?
    let developer: [Developer]?
    let mtr: [Mtr]?

    enum CodingKeys: String, CodingKey {
        case district
        case estate
        case school
        case developer
        case mtr
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        district = try values.decodeIfPresent([District].self, forKey: .district)
        estate = try values.decodeIfPresent([Estate].self, forKey: .estate)
        school = try values.decodeIfPresent([School].self, forKey: .school)
        developer = try values.decodeIfPresent([Developer].self, forKey: .developer)
        mtr = try values.decodeIfPresent([Mtr].self, forKey: .mtr)
    }
}

extension CLMGGetPostFilterOptions {
    struct District: Codable {
        let resultType: String?
        let labelC: String?
        let labelE: String?
        let value: String?
        let count: Int?
        let center: Center?
        let zoomTo: Int?
        let lastLevel: Bool?
        let search: Search?

        enum CodingKeys: String, CodingKey {
            case resultType
            case labelC
            case labelE
            case value
            case count
            case center
            case zoomTo
            case lastLevel
            case search
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
            labelC = try values.decodeIfPresent(String.self, forKey: .labelC)
            labelE = try values.decodeIfPresent(String.self, forKey: .labelE)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            center = try values.decodeIfPresent(Center.self, forKey: .center)
            zoomTo = try values.decodeIfPresent(Int.self, forKey: .zoomTo)
            lastLevel = try values.decodeIfPresent(Bool.self, forKey: .lastLevel)
            search = try values.decodeIfPresent(Search.self, forKey: .search)
        }
    }

    struct Estate: Codable {
        let resultType: String?
        let labelC: String?
        let labelE: String?
        let value: String?
        let count: Int?
        let center: Center?
        let zoomTo: Int?
        let lastLevel: Bool?
        let search: Search?

        enum CodingKeys: String, CodingKey {
            case resultType
            case labelC
            case labelE
            case value
            case count
            case center
            case zoomTo
            case lastLevel
            case search
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
            labelC = try values.decodeIfPresent(String.self, forKey: .labelC)
            labelE = try values.decodeIfPresent(String.self, forKey: .labelE)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            center = try values.decodeIfPresent(Center.self, forKey: .center)
            zoomTo = try values.decodeIfPresent(Int.self, forKey: .zoomTo)
            lastLevel = try values.decodeIfPresent(Bool.self, forKey: .lastLevel)
            search = try values.decodeIfPresent(Search.self, forKey: .search)
        }
    }

    struct School: Codable {
        let resultType: String?
        let labelC: String?
        let labelE: String?
        let value: String?
        let count: Int?
        let center: Center?
        let zoomTo: Int?
        let lastLevel: Bool?
        let search: Search?

        enum CodingKeys: String, CodingKey {
            case resultType
            case labelC
            case labelE
            case value
            case count
            case center
            case zoomTo
            case lastLevel
            case search
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
            labelC = try values.decodeIfPresent(String.self, forKey: .labelC)
            labelE = try values.decodeIfPresent(String.self, forKey: .labelE)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            center = try values.decodeIfPresent(Center.self, forKey: .center)
            zoomTo = try values.decodeIfPresent(Int.self, forKey: .zoomTo)
            lastLevel = try values.decodeIfPresent(Bool.self, forKey: .lastLevel)
            search = try values.decodeIfPresent(Search.self, forKey: .search)
        }
    }

    struct Developer: Codable {
        let resultType: String?
        let labelC: String?
        let labelE: String?
        let value: String?
        let count: Int?
        let center: Center?
        let zoomTo: Int?
        let lastLevel: Bool?
        let search: Search?

        enum CodingKeys: String, CodingKey {
            case resultType
            case labelC
            case labelE
            case value
            case count
            case center
            case zoomTo
            case lastLevel
            case search
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
            labelC = try values.decodeIfPresent(String.self, forKey: .labelC)
            labelE = try values.decodeIfPresent(String.self, forKey: .labelE)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            center = try values.decodeIfPresent(Center.self, forKey: .center)
            zoomTo = try values.decodeIfPresent(Int.self, forKey: .zoomTo)
            lastLevel = try values.decodeIfPresent(Bool.self, forKey: .lastLevel)
            search = try values.decodeIfPresent(Search.self, forKey: .search)
        }
    }

    struct Mtr: Codable {
        let resultType: String?
        let labelC: String?
        let labelE: String?
        let value: String?
        let count: Int?
        let center: Center?
        let zoomTo: Int?
        let lastLevel: Bool?
        let search: Search?

        enum CodingKeys: String, CodingKey {
            case resultType
            case labelC
            case labelE
            case value
            case count
            case center
            case zoomTo
            case lastLevel
            case search
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
            labelC = try values.decodeIfPresent(String.self, forKey: .labelC)
            labelE = try values.decodeIfPresent(String.self, forKey: .labelE)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            center = try values.decodeIfPresent(Center.self, forKey: .center)
            zoomTo = try values.decodeIfPresent(Int.self, forKey: .zoomTo)
            lastLevel = try values.decodeIfPresent(Bool.self, forKey: .lastLevel)
            search = try values.decodeIfPresent(Search.self, forKey: .search)
        }
    }

    struct Center: Codable {
        let latitude: Double?
        let longitude: Double?

        enum CodingKeys: String, CodingKey {
            case latitude
            case longitude
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
            longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        }
    }

    struct Search: Codable {
        let mtrs: [String]?
        let mapLevelMappingType: String?
        let autoCompleteZoomToBottomLayer: Bool?

        enum CodingKeys: String, CodingKey {
            case mtrs
            case mapLevelMappingType
            case autoCompleteZoomToBottomLayer
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            mtrs = try values.decodeIfPresent([String].self, forKey: .mtrs)
            mapLevelMappingType = try values.decodeIfPresent(String.self, forKey: .mapLevelMappingType)
            autoCompleteZoomToBottomLayer = try values.decodeIfPresent(Bool.self, forKey: .autoCompleteZoomToBottomLayer)
        }
    }
}
