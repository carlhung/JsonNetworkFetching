/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

 */

import Foundation
struct CLMGTransactionSearch: Codable {
    let count: Int?
    let data: [ReturnedData]?

    enum CodingKeys: String, CodingKey {
        case count
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        data = try values.decodeIfPresent([ReturnedData].self, forKey: .data)
    }

    struct ReturnedData: Codable {
        let id: String?
        let districtName: String?
        let bigEstateName: String?
        let estateName: String?
        let buildingName: String?
        let address: String?
        let yAxis: String?
        let xAxis: String?
        let transactionPrice: Double?
        let postType: String?
        let typeCode: String?
        let media: Media?
        let floorPlans: [String]?
        let nArea: Int?
        let nUnitPrice: Int?
        let regDate: String?
        let insDate: String?
        let dataSource: String?
        let oldTransactionID: String?
        let oldDataSource: String?
        let detailUrl: String?
        let scope: Scope?
        let developer: [Developer]?

        enum CodingKeys: String, CodingKey {
            case id
            case districtName
            case bigEstateName
            case estateName
            case buildingName
            case address
            case yAxis
            case xAxis
            case transactionPrice
            case postType
            case typeCode
            case media
            case floorPlans
            case nArea
            case nUnitPrice
            case regDate
            case insDate
            case dataSource
            case oldTransactionID
            case oldDataSource
            case detailUrl
            case scope
            case developer
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
            bigEstateName = try values.decodeIfPresent(String.self, forKey: .bigEstateName)
            estateName = try values.decodeIfPresent(String.self, forKey: .estateName)
            buildingName = try values.decodeIfPresent(String.self, forKey: .buildingName)
            address = try values.decodeIfPresent(String.self, forKey: .address)
            yAxis = try values.decodeIfPresent(String.self, forKey: .yAxis)
            xAxis = try values.decodeIfPresent(String.self, forKey: .xAxis)
            transactionPrice = try values.decodeIfPresent(Double.self, forKey: .transactionPrice)
            postType = try values.decodeIfPresent(String.self, forKey: .postType)
            typeCode = try values.decodeIfPresent(String.self, forKey: .typeCode)
            media = try values.decodeIfPresent(Media.self, forKey: .media)
            floorPlans = try values.decodeIfPresent([String].self, forKey: .floorPlans)
            nArea = try values.decodeIfPresent(Int.self, forKey: .nArea)
            nUnitPrice = try values.decodeIfPresent(Int.self, forKey: .nUnitPrice)
            regDate = try values.decodeIfPresent(String.self, forKey: .regDate)
            insDate = try values.decodeIfPresent(String.self, forKey: .insDate)
            dataSource = try values.decodeIfPresent(String.self, forKey: .dataSource)
            oldTransactionID = try values.decodeIfPresent(String.self, forKey: .oldTransactionID)
            oldDataSource = try values.decodeIfPresent(String.self, forKey: .oldDataSource)
            detailUrl = try values.decodeIfPresent(String.self, forKey: .detailUrl)
            scope = try values.decodeIfPresent(Scope.self, forKey: .scope)
            developer = try values.decodeIfPresent([Developer].self, forKey: .developer)
        }
    }

    struct Media: Codable {
        let hasPostImage: Bool?
        let hasStreetView: Bool?
        let hasSphere: Bool?
        let hasVideo: Bool?
        let hasVR: Bool?
        let hasFloorPlan: Bool?
        let hasUnitPlan: Bool?

        enum CodingKeys: String, CodingKey {
            case hasPostImage
            case hasStreetView
            case hasSphere
            case hasVideo
            case hasVR
            case hasFloorPlan
            case hasUnitPlan
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            hasPostImage = try values.decodeIfPresent(Bool.self, forKey: .hasPostImage)
            hasStreetView = try values.decodeIfPresent(Bool.self, forKey: .hasStreetView)
            hasSphere = try values.decodeIfPresent(Bool.self, forKey: .hasSphere)
            hasVideo = try values.decodeIfPresent(Bool.self, forKey: .hasVideo)
            hasVR = try values.decodeIfPresent(Bool.self, forKey: .hasVR)
            hasFloorPlan = try values.decodeIfPresent(Bool.self, forKey: .hasFloorPlan)
            hasUnitPlan = try values.decodeIfPresent(Bool.self, forKey: .hasUnitPlan)
        }
    }

    struct Developer: Codable {
        let devid: String?
        let pc_dev: String?
        let pe_dev: String?
        let pc_shortna: String?
        let pe_shortna: String?

        enum CodingKeys: String, CodingKey {
            case devid
            case pc_dev
            case pe_dev
            case pc_shortna
            case pe_shortna
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            devid = try values.decodeIfPresent(String.self, forKey: .devid)
            pc_dev = try values.decodeIfPresent(String.self, forKey: .pc_dev)
            pe_dev = try values.decodeIfPresent(String.self, forKey: .pe_dev)
            pc_shortna = try values.decodeIfPresent(String.self, forKey: .pc_shortna)
            pe_shortna = try values.decodeIfPresent(String.self, forKey: .pe_shortna)
        }
    }

    struct Scope: Codable {
        let scp_mkt: String?
        let terr: String?
        let db_code: String?
        let db: String?
        let webScopeID: String?
        let webScope: String?
        let hma_id: String?
        let hma: String?
        let hmaDesc: String?
        let hmaThumbnail: String?

        enum CodingKeys: String, CodingKey {
            case scp_mkt
            case terr
            case db_code
            case db
            case webScopeID
            case webScope
            case hma_id
            case hma
            case hmaDesc
            case hmaThumbnail
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            scp_mkt = try values.decodeIfPresent(String.self, forKey: .scp_mkt)
            terr = try values.decodeIfPresent(String.self, forKey: .terr)
            db_code = try values.decodeIfPresent(String.self, forKey: .db_code)
            db = try values.decodeIfPresent(String.self, forKey: .db)
            webScopeID = try values.decodeIfPresent(String.self, forKey: .webScopeID)
            webScope = try values.decodeIfPresent(String.self, forKey: .webScope)
            hma_id = try values.decodeIfPresent(String.self, forKey: .hma_id)
            hma = try values.decodeIfPresent(String.self, forKey: .hma)
            hmaDesc = try values.decodeIfPresent(String.self, forKey: .hmaDesc)
            hmaThumbnail = try values.decodeIfPresent(String.self, forKey: .hmaThumbnail)
        }
    }
}
