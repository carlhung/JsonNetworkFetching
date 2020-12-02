/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NewProperties : Codable {
	let districtName : String?
	let newPropertyNameC : String?
	let newPropertyNameE : String?
	let address : String?
	let id : Int?
	let newPropertyName : String?
	let thumbnailUrl : String?
	let saleStatus : String?
	let propertyStatus : String?
	let firstSalesArrangementDateTime : String?
	let firstPriceListDateTime : String?
	let market : String?
	let media : Media?
	let soldOut : Bool?
	let detailUrl : String?

	enum CodingKeys: String, CodingKey {

		case districtName = "districtName"
		case newPropertyNameC = "newPropertyNameC"
		case newPropertyNameE = "newPropertyNameE"
		case address = "address"
		case id = "id"
		case newPropertyName = "newPropertyName"
		case thumbnailUrl = "thumbnailUrl"
		case saleStatus = "saleStatus"
		case propertyStatus = "propertyStatus"
		case firstSalesArrangementDateTime = "firstSalesArrangementDateTime"
		case firstPriceListDateTime = "firstPriceListDateTime"
		case market = "market"
		case media = "media"
		case soldOut = "soldOut"
		case detailUrl = "detailUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
		newPropertyNameC = try values.decodeIfPresent(String.self, forKey: .newPropertyNameC)
		newPropertyNameE = try values.decodeIfPresent(String.self, forKey: .newPropertyNameE)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		newPropertyName = try values.decodeIfPresent(String.self, forKey: .newPropertyName)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		saleStatus = try values.decodeIfPresent(String.self, forKey: .saleStatus)
		propertyStatus = try values.decodeIfPresent(String.self, forKey: .propertyStatus)
		firstSalesArrangementDateTime = try values.decodeIfPresent(String.self, forKey: .firstSalesArrangementDateTime)
		firstPriceListDateTime = try values.decodeIfPresent(String.self, forKey: .firstPriceListDateTime)
		market = try values.decodeIfPresent(String.self, forKey: .market)
		media = try values.decodeIfPresent(Media.self, forKey: .media)
		soldOut = try values.decodeIfPresent(Bool.self, forKey: .soldOut)
		detailUrl = try values.decodeIfPresent(String.self, forKey: .detailUrl)
	}

}