/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct RentPosts : Codable {
	let id : String?
	let bigEstateName : String?
	let estateName : String?
	let buildingName : String?
	let display : String?
	let displayText : DisplayText?
	let yAxis : String?
	let xAxis : String?
	let salePrice : Int?
	let salePriceOriginal : Int?
	let rentPrice : Int?
	let unitPrice : Int?
	let nUnitPrice : Int?
	let unitRent : Int?
	let nUnitRent : Int?
	let size : Int?
	let nSize : Int?
	let bedroomCount : Int?
	let hos_flag : Bool?
	let prh_flag : Bool?
	let postType : String?
	let typeCode : String?
	let refNo : String?
	let thumbnail : String?
	let districtName : String?
	let topicNames : [String]?
	let statelyHomeId : String?
	let media : Media?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case bigEstateName = "bigEstateName"
		case estateName = "estateName"
		case buildingName = "buildingName"
		case display = "display"
		case displayText = "displayText"
		case yAxis = "yAxis"
		case xAxis = "xAxis"
		case salePrice = "salePrice"
		case salePriceOriginal = "salePriceOriginal"
		case rentPrice = "rentPrice"
		case unitPrice = "unitPrice"
		case nUnitPrice = "nUnitPrice"
		case unitRent = "unitRent"
		case nUnitRent = "nUnitRent"
		case size = "size"
		case nSize = "nSize"
		case bedroomCount = "bedroomCount"
		case hos_flag = "hos_flag"
		case prh_flag = "prh_flag"
		case postType = "postType"
		case typeCode = "typeCode"
		case refNo = "refNo"
		case thumbnail = "thumbnail"
		case districtName = "districtName"
		case topicNames = "topicNames"
		case statelyHomeId = "statelyHomeId"
		case media = "media"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		bigEstateName = try values.decodeIfPresent(String.self, forKey: .bigEstateName)
		estateName = try values.decodeIfPresent(String.self, forKey: .estateName)
		buildingName = try values.decodeIfPresent(String.self, forKey: .buildingName)
		display = try values.decodeIfPresent(String.self, forKey: .display)
		displayText = try values.decodeIfPresent(DisplayText.self, forKey: .displayText)
		yAxis = try values.decodeIfPresent(String.self, forKey: .yAxis)
		xAxis = try values.decodeIfPresent(String.self, forKey: .xAxis)
		salePrice = try values.decodeIfPresent(Int.self, forKey: .salePrice)
		salePriceOriginal = try values.decodeIfPresent(Int.self, forKey: .salePriceOriginal)
		rentPrice = try values.decodeIfPresent(Int.self, forKey: .rentPrice)
		unitPrice = try values.decodeIfPresent(Int.self, forKey: .unitPrice)
		nUnitPrice = try values.decodeIfPresent(Int.self, forKey: .nUnitPrice)
		unitRent = try values.decodeIfPresent(Int.self, forKey: .unitRent)
		nUnitRent = try values.decodeIfPresent(Int.self, forKey: .nUnitRent)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		nSize = try values.decodeIfPresent(Int.self, forKey: .nSize)
		bedroomCount = try values.decodeIfPresent(Int.self, forKey: .bedroomCount)
		hos_flag = try values.decodeIfPresent(Bool.self, forKey: .hos_flag)
		prh_flag = try values.decodeIfPresent(Bool.self, forKey: .prh_flag)
		postType = try values.decodeIfPresent(String.self, forKey: .postType)
		typeCode = try values.decodeIfPresent(String.self, forKey: .typeCode)
		refNo = try values.decodeIfPresent(String.self, forKey: .refNo)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
		topicNames = try values.decodeIfPresent([String].self, forKey: .topicNames)
		statelyHomeId = try values.decodeIfPresent(String.self, forKey: .statelyHomeId)
		media = try values.decodeIfPresent(Media.self, forKey: .media)
	}

}