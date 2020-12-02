/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let views : [Views]?
	let chars : [Chars]?
	let facilities : [Facilities]?
	let developer : [Developer]?
	let bedroomCount : [BedroomCount]?
	let estateUsage : [EstateUsage]?
	let salePrice : SalePrice?
	let rentPrice : RentPrice?
	let nSize : NSize?
	let nUnitPrice : NUnitPrice?
	let buildingAge : BuildingAge?
	let categories : [Categories]?
	let floors : [Floors]?
	let estates : [Estates]?
	let phases : [Phases]?
	let lookUpKeys : [String]?
	let hmas : [Hmas]?

	enum CodingKeys: String, CodingKey {

		case views = "Views"
		case chars = "Chars"
		case facilities = "Facilities"
		case developer = "Developer"
		case bedroomCount = "BedroomCount"
		case estateUsage = "EstateUsage"
		case salePrice = "SalePrice"
		case rentPrice = "RentPrice"
		case nSize = "NSize"
		case nUnitPrice = "NUnitPrice"
		case buildingAge = "BuildingAge"
		case categories = "Categories"
		case floors = "Floors"
		case estates = "Estates"
		case phases = "Phases"
		case lookUpKeys = "LookUpKeys"
		case hmas = "Hmas"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		views = try values.decodeIfPresent([Views].self, forKey: .views)
		chars = try values.decodeIfPresent([Chars].self, forKey: .chars)
		facilities = try values.decodeIfPresent([Facilities].self, forKey: .facilities)
		developer = try values.decodeIfPresent([Developer].self, forKey: .developer)
		bedroomCount = try values.decodeIfPresent([BedroomCount].self, forKey: .bedroomCount)
		estateUsage = try values.decodeIfPresent([EstateUsage].self, forKey: .estateUsage)
		salePrice = try values.decodeIfPresent(SalePrice.self, forKey: .salePrice)
		rentPrice = try values.decodeIfPresent(RentPrice.self, forKey: .rentPrice)
		nSize = try values.decodeIfPresent(NSize.self, forKey: .nSize)
		nUnitPrice = try values.decodeIfPresent(NUnitPrice.self, forKey: .nUnitPrice)
		buildingAge = try values.decodeIfPresent(BuildingAge.self, forKey: .buildingAge)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
		floors = try values.decodeIfPresent([Floors].self, forKey: .floors)
		estates = try values.decodeIfPresent([Estates].self, forKey: .estates)
		phases = try values.decodeIfPresent([Phases].self, forKey: .phases)
		lookUpKeys = try values.decodeIfPresent([String].self, forKey: .lookUpKeys)
		hmas = try values.decodeIfPresent([Hmas].self, forKey: .hmas)
	}

}