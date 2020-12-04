/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

 */

import Foundation
struct CLMGPostSearch: Codable {
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
}

extension CLMGPostSearch {
    struct ReturnedData: Codable {
        let id: String?
        let estateType: String?
        let bigEstateName: String?
        let estateName: String?
        let buildingName: String?
        let bigestcode: String?
        let cestcode: String?
        let cblgcode: String?
        let address: String?
        let display: String?
        let displayText: DisplayText?
        let yAxis: String?
        let xAxis: String?
        let buildingType: String?
        let unitType: String?
        let salePrice: Double?
        let salePriceOriginal: Int?
        let monthlyPayment: Double?
        let rentPrice: Double?
        let unitPrice: Double?
        let nUnitPrice: Double?
        let unitRent: Double?
        let nUnitRent: Double?
        let size: Double?
        let nSize: Double?
        let nSizeRatio: Double?
        let bedroomCount: Int?
        let buildingAge: Int?
        let direction: String?
        let hos_flag: Bool?
        let prh_flag: Bool?
        let managementInclu: Bool?
        let postType: String?
        let typeCode: String?
        let refNo: String?
        let scope: Scope?
        let media: Media?
        let thumbnail: String?
        let districtName: String?
        let topicNames: [String]?
        let statelyHomeId: String?
        let schoolNet: SchoolNet?
        let updateDate: String?
        let postAgents: [PostAgents]?
        let isHouse: Bool?
        let detailUrl: String?
        let isVrNavigation: Bool?
        let displayStyle: Int?
        let showMap: Bool?
        let cMap: CMap?
        let withLease: Bool?
        let whatsAppInfo: WhatsAppInfo?

        enum CodingKeys: String, CodingKey {
            case id
            case estateType
            case bigEstateName
            case estateName
            case buildingName
            case bigestcode
            case cestcode
            case cblgcode
            case address
            case display
            case displayText
            case yAxis
            case xAxis
            case buildingType
            case unitType
            case salePrice
            case salePriceOriginal
            case monthlyPayment
            case rentPrice
            case unitPrice
            case nUnitPrice
            case unitRent
            case nUnitRent
            case size
            case nSize
            case nSizeRatio
            case bedroomCount
            case buildingAge
            case direction
            case hos_flag
            case prh_flag
            case managementInclu
            case postType
            case typeCode
            case refNo
            case scope
            case media
            case thumbnail
            case districtName
            case topicNames
            case statelyHomeId
            case schoolNet
            case updateDate
            case postAgents
            case isHouse
            case detailUrl
            case isVrNavigation
            case displayStyle
            case showMap
            case cMap
            case withLease
            case whatsAppInfo
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            estateType = try values.decodeIfPresent(String.self, forKey: .estateType)
            bigEstateName = try values.decodeIfPresent(String.self, forKey: .bigEstateName)
            estateName = try values.decodeIfPresent(String.self, forKey: .estateName)
            buildingName = try values.decodeIfPresent(String.self, forKey: .buildingName)
            bigestcode = try values.decodeIfPresent(String.self, forKey: .bigestcode)
            cestcode = try values.decodeIfPresent(String.self, forKey: .cestcode)
            cblgcode = try values.decodeIfPresent(String.self, forKey: .cblgcode)
            address = try values.decodeIfPresent(String.self, forKey: .address)
            display = try values.decodeIfPresent(String.self, forKey: .display)
            displayText = try values.decodeIfPresent(DisplayText.self, forKey: .displayText)
            yAxis = try values.decodeIfPresent(String.self, forKey: .yAxis)
            xAxis = try values.decodeIfPresent(String.self, forKey: .xAxis)
            buildingType = try values.decodeIfPresent(String.self, forKey: .buildingType)
            unitType = try values.decodeIfPresent(String.self, forKey: .unitType)
            salePrice = try values.decodeIfPresent(Double.self, forKey: .salePrice)
            salePriceOriginal = try values.decodeIfPresent(Int.self, forKey: .salePriceOriginal)
            monthlyPayment = try values.decodeIfPresent(Double.self, forKey: .monthlyPayment)
            rentPrice = try values.decodeIfPresent(Double.self, forKey: .rentPrice)
            unitPrice = try values.decodeIfPresent(Double.self, forKey: .unitPrice)
            nUnitPrice = try values.decodeIfPresent(Double.self, forKey: .nUnitPrice)
            unitRent = try values.decodeIfPresent(Double.self, forKey: .unitRent)
            nUnitRent = try values.decodeIfPresent(Double.self, forKey: .nUnitRent)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            nSize = try values.decodeIfPresent(Double.self, forKey: .nSize)
            nSizeRatio = try values.decodeIfPresent(Double.self, forKey: .nSizeRatio)
            bedroomCount = try values.decodeIfPresent(Int.self, forKey: .bedroomCount)
            buildingAge = try values.decodeIfPresent(Int.self, forKey: .buildingAge)
            direction = try values.decodeIfPresent(String.self, forKey: .direction)
            hos_flag = try values.decodeIfPresent(Bool.self, forKey: .hos_flag)
            prh_flag = try values.decodeIfPresent(Bool.self, forKey: .prh_flag)
            managementInclu = try values.decodeIfPresent(Bool.self, forKey: .managementInclu)
            postType = try values.decodeIfPresent(String.self, forKey: .postType)
            typeCode = try values.decodeIfPresent(String.self, forKey: .typeCode)
            refNo = try values.decodeIfPresent(String.self, forKey: .refNo)
            scope = try values.decodeIfPresent(Scope.self, forKey: .scope)
            media = try values.decodeIfPresent(Media.self, forKey: .media)
            thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
            districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
            topicNames = try values.decodeIfPresent([String].self, forKey: .topicNames)
            statelyHomeId = try values.decodeIfPresent(String.self, forKey: .statelyHomeId)
            schoolNet = try values.decodeIfPresent(SchoolNet.self, forKey: .schoolNet)
            updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
            postAgents = try values.decodeIfPresent([PostAgents].self, forKey: .postAgents)
            isHouse = try values.decodeIfPresent(Bool.self, forKey: .isHouse)
            detailUrl = try values.decodeIfPresent(String.self, forKey: .detailUrl)
            isVrNavigation = try values.decodeIfPresent(Bool.self, forKey: .isVrNavigation)
            displayStyle = try values.decodeIfPresent(Int.self, forKey: .displayStyle)
            showMap = try values.decodeIfPresent(Bool.self, forKey: .showMap)
            cMap = try values.decodeIfPresent(CMap.self, forKey: .cMap)
            withLease = try values.decodeIfPresent(Bool.self, forKey: .withLease)
            whatsAppInfo = try values.decodeIfPresent(WhatsAppInfo.self, forKey: .whatsAppInfo)
        }
    }
}

extension CLMGPostSearch.ReturnedData {
    struct DisplayText: Codable {
        let addr: Addr?
        let price: Price?
        let unitPrice: UnitPrice?

        enum CodingKeys: String, CodingKey {
            case addr
            case price
            case unitPrice
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            addr = try values.decodeIfPresent(Addr.self, forKey: .addr)
            price = try values.decodeIfPresent(Price.self, forKey: .price)
            unitPrice = try values.decodeIfPresent(UnitPrice.self, forKey: .unitPrice)
        }
    }

    struct Addr: Codable {
        let line2Est: String?
        let line3Floor: String?
        let line4Addr: String?

        enum CodingKeys: String, CodingKey {
            case line2Est
            case line3Floor
            case line4Addr
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            line2Est = try values.decodeIfPresent(String.self, forKey: .line2Est)
            line3Floor = try values.decodeIfPresent(String.self, forKey: .line3Floor)
            line4Addr = try values.decodeIfPresent(String.self, forKey: .line4Addr)
        }
    }

    struct AgentVideos: Codable {
        let vdo360URL: String?
        let vdo480URL: String?
        let vdo720URL: String?
        let vdoThumbnailURL: String?
        let stfRanking: Int?
        let stfNo: String?

        enum CodingKeys: String, CodingKey {
            case vdo360URL
            case vdo480URL
            case vdo720URL
            case vdoThumbnailURL
            case stfRanking
            case stfNo
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            vdo360URL = try values.decodeIfPresent(String.self, forKey: .vdo360URL)
            vdo480URL = try values.decodeIfPresent(String.self, forKey: .vdo480URL)
            vdo720URL = try values.decodeIfPresent(String.self, forKey: .vdo720URL)
            vdoThumbnailURL = try values.decodeIfPresent(String.self, forKey: .vdoThumbnailURL)
            stfRanking = try values.decodeIfPresent(Int.self, forKey: .stfRanking)
            stfNo = try values.decodeIfPresent(String.self, forKey: .stfNo)
        }
    }

    struct CMap: Codable {
        let lpt_x: Int?
        let lpt_y: Int?

        enum CodingKeys: String, CodingKey {
            case lpt_x
            case lpt_y
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            lpt_x = try values.decodeIfPresent(Int.self, forKey: .lpt_x)
            lpt_y = try values.decodeIfPresent(Int.self, forKey: .lpt_y)
        }
    }

    struct FloorPlans: Codable {
        let floorName: String?
        let thumbnailUrl: String?
        let imgOrder: Int?
        let floorPlanType: String?

        enum CodingKeys: String, CodingKey {
            case floorName
            case thumbnailUrl
            case imgOrder
            case floorPlanType
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            floorName = try values.decodeIfPresent(String.self, forKey: .floorName)
            thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
            imgOrder = try values.decodeIfPresent(Int.self, forKey: .imgOrder)
            floorPlanType = try values.decodeIfPresent(String.self, forKey: .floorPlanType)
        }
    }

    struct Media: Codable {
        let postImages: [PostImages]?
        let streetViews: [StreetViews]?
        let spheres: [String]?
        let agentVideos: [AgentVideos]?
        let vrList: [VrList]?
        let floorPlans: [FloorPlans]?
        let unitPlans: [UnitPlans]?
        let hasPostImage: Bool?
        let hasStreetView: Bool?
        let hasSphere: Bool?
        let hasVideo: Bool?
        let hasVR: Bool?
        let hasFloorPlan: Bool?
        let hasUnitPlan: Bool?

        enum CodingKeys: String, CodingKey {
            case postImages
            case streetViews
            case spheres
            case agentVideos
            case vrList
            case floorPlans
            case unitPlans
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
            postImages = try values.decodeIfPresent([PostImages].self, forKey: .postImages)
            streetViews = try values.decodeIfPresent([StreetViews].self, forKey: .streetViews)
            spheres = try values.decodeIfPresent([String].self, forKey: .spheres)
            agentVideos = try values.decodeIfPresent([AgentVideos].self, forKey: .agentVideos)
            vrList = try values.decodeIfPresent([VrList].self, forKey: .vrList)
            floorPlans = try values.decodeIfPresent([FloorPlans].self, forKey: .floorPlans)
            unitPlans = try values.decodeIfPresent([UnitPlans].self, forKey: .unitPlans)
            hasPostImage = try values.decodeIfPresent(Bool.self, forKey: .hasPostImage)
            hasStreetView = try values.decodeIfPresent(Bool.self, forKey: .hasStreetView)
            hasSphere = try values.decodeIfPresent(Bool.self, forKey: .hasSphere)
            hasVideo = try values.decodeIfPresent(Bool.self, forKey: .hasVideo)
            hasVR = try values.decodeIfPresent(Bool.self, forKey: .hasVR)
            hasFloorPlan = try values.decodeIfPresent(Bool.self, forKey: .hasFloorPlan)
            hasUnitPlan = try values.decodeIfPresent(Bool.self, forKey: .hasUnitPlan)
        }
    }

    struct PostAgents: Codable {
        let agentNo: String?
        let agentNameC: String?
        let agentNameE: String?
        let agentLicense: String?
        let thumbnail: String?
        let agentMobile: String?
        let characteristic: String?
        let chattable: Bool?
        let canWeChat: Bool?
        let canWhatsApp: Bool?
        let branchName: String?
        let agentStar: Double?
        let totalPostCount: Int?
        let ranking: Int?
        let costCtr: String?
        let whatsAppInfo: WhatsAppInfo?

        enum CodingKeys: String, CodingKey {
            case agentNo
            case agentNameC
            case agentNameE
            case agentLicense
            case thumbnail
            case agentMobile
            case characteristic
            case chattable
            case canWeChat
            case canWhatsApp
            case branchName
            case agentStar
            case totalPostCount
            case ranking
            case costCtr
            case whatsAppInfo
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            agentNo = try values.decodeIfPresent(String.self, forKey: .agentNo)
            agentNameC = try values.decodeIfPresent(String.self, forKey: .agentNameC)
            agentNameE = try values.decodeIfPresent(String.self, forKey: .agentNameE)
            agentLicense = try values.decodeIfPresent(String.self, forKey: .agentLicense)
            thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
            agentMobile = try values.decodeIfPresent(String.self, forKey: .agentMobile)
            characteristic = try values.decodeIfPresent(String.self, forKey: .characteristic)
            chattable = try values.decodeIfPresent(Bool.self, forKey: .chattable)
            canWeChat = try values.decodeIfPresent(Bool.self, forKey: .canWeChat)
            canWhatsApp = try values.decodeIfPresent(Bool.self, forKey: .canWhatsApp)
            branchName = try values.decodeIfPresent(String.self, forKey: .branchName)
            agentStar = try values.decodeIfPresent(Double.self, forKey: .agentStar)
            totalPostCount = try values.decodeIfPresent(Int.self, forKey: .totalPostCount)
            ranking = try values.decodeIfPresent(Int.self, forKey: .ranking)
            costCtr = try values.decodeIfPresent(String.self, forKey: .costCtr)
            whatsAppInfo = try values.decodeIfPresent(WhatsAppInfo.self, forKey: .whatsAppInfo)
        }
    }

    struct PostImages: Codable {
        let path: String?
        let seq: Int?
        let description: String?

        enum CodingKeys: String, CodingKey {
            case path
            case seq
            case description
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            seq = try values.decodeIfPresent(Int.self, forKey: .seq)
            description = try values.decodeIfPresent(String.self, forKey: .description)
        }
    }

    struct Price: Codable {
        let paidOriginal: String?
        let paidCurrent: String?
        let rentCurrent: String?

        enum CodingKeys: String, CodingKey {
            case paidOriginal
            case paidCurrent
            case rentCurrent
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            paidOriginal = try values.decodeIfPresent(String.self, forKey: .paidOriginal)
            paidCurrent = try values.decodeIfPresent(String.self, forKey: .paidCurrent)
            rentCurrent = try values.decodeIfPresent(String.self, forKey: .rentCurrent)
        }
    }

    struct SchoolNet: Codable {
        let primarySchoolNetwork: String?
        let secondarySchoolScope: SecondarySchoolScope?

        enum CodingKeys: String, CodingKey {
            case primarySchoolNetwork
            case secondarySchoolScope
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            primarySchoolNetwork = try values.decodeIfPresent(String.self, forKey: .primarySchoolNetwork)
            secondarySchoolScope = try values.decodeIfPresent(SecondarySchoolScope.self, forKey: .secondarySchoolScope)
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

        enum CodingKeys: String, CodingKey {
            case scp_mkt
            case terr
            case db_code
            case db
            case webScopeID
            case webScope
            case hma_id
            case hma
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
        }
    }

    struct SecondarySchoolScope: Codable {
        let scp_mkt: String?
        let terr: String?
        let db_code: String?
        let db: String?

        enum CodingKeys: String, CodingKey {
            case scp_mkt
            case terr
            case db_code
            case db
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            scp_mkt = try values.decodeIfPresent(String.self, forKey: .scp_mkt)
            terr = try values.decodeIfPresent(String.self, forKey: .terr)
            db_code = try values.decodeIfPresent(String.self, forKey: .db_code)
            db = try values.decodeIfPresent(String.self, forKey: .db)
        }
    }

    struct StreetViews: Codable {
        let thumbnailPath: String?
        let url: String?

        enum CodingKeys: String, CodingKey {
            case thumbnailPath
            case url
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            thumbnailPath = try values.decodeIfPresent(String.self, forKey: .thumbnailPath)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }
    }

    struct UnitPlans: Codable {
        let thumbnailUrl: String?

        enum CodingKeys: String, CodingKey {
            case thumbnailUrl
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
        }
    }

    struct UnitPrice: Codable {
        let nPaid: String?
        let gPaid: String?
        let nRent: String?
        let gRent: String?

        enum CodingKeys: String, CodingKey {
            case nPaid
            case gPaid
            case nRent
            case gRent
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            nPaid = try values.decodeIfPresent(String.self, forKey: .nPaid)
            gPaid = try values.decodeIfPresent(String.self, forKey: .gPaid)
            nRent = try values.decodeIfPresent(String.self, forKey: .nRent)
            gRent = try values.decodeIfPresent(String.self, forKey: .gRent)
        }
    }

    struct VrList: Codable {
        let thumbnailUrl: String?
        let modelUrl: String?
        let agentNo: String?
        let vrType: String?

        enum CodingKeys: String, CodingKey {
            case thumbnailUrl
            case modelUrl
            case agentNo
            case vrType
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
            modelUrl = try values.decodeIfPresent(String.self, forKey: .modelUrl)
            agentNo = try values.decodeIfPresent(String.self, forKey: .agentNo)
            vrType = try values.decodeIfPresent(String.self, forKey: .vrType)
        }
    }

    struct WhatsAppInfo: Codable {
        let url: String?
        let enabled: Bool?
        let areaCode: String?
        let msg: String?

        enum CodingKeys: String, CodingKey {
            case url
            case enabled
            case areaCode
            case msg
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            enabled = try values.decodeIfPresent(Bool.self, forKey: .enabled)
            areaCode = try values.decodeIfPresent(String.self, forKey: .areaCode)
            msg = try values.decodeIfPresent(String.self, forKey: .msg)
        }
    }
}
