/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GetBranchFilterOptionsRequestBody : Encodable {
	let keyword : String?
	let typeCodes : [String]?
	let bigestAndEstate : [String]?
	let dept : String?
	let costCtr : String?
	let costCtrWebScopeIDs : [String]?
	let primarySchoolNets : [String]?
	let schools : [String]?
	let mtrs : [String]?
	let offset : Int?
	let size : Int?
	let autoCompleteZoomToBottomLayer : Bool?
	let sort : String?
	let order : String?
	let geoFilter : GeoFilter?
	let geoNearBy : GeoNearBy?

	enum CodingKeys: String, CodingKey {

		case keyword = "Keyword"
		case typeCodes = "TypeCodes"
		case bigestAndEstate = "BigestAndEstate"
		case dept = "Dept"
		case costCtr = "CostCtr"
		case costCtrWebScopeIDs = "CostCtrWebScopeIDs"
		case primarySchoolNets = "PrimarySchoolNets"
		case schools = "Schools"
		case mtrs = "Mtrs"
		case offset = "Offset"
		case size = "Size"
		case autoCompleteZoomToBottomLayer = "AutoCompleteZoomToBottomLayer"
		case sort = "Sort"
		case order = "Order"
		case geoFilter = "GeoFilter"
		case geoNearBy = "GeoNearBy"
	}

//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		keyword = try values.decodeIfPresent(String.self, forKey: .keyword)
//		typeCodes = try values.decodeIfPresent([String].self, forKey: .typeCodes)
//		bigestAndEstate = try values.decodeIfPresent([String].self, forKey: .bigestAndEstate)
//		dept = try values.decodeIfPresent(String.self, forKey: .dept)
//		costCtr = try values.decodeIfPresent(String.self, forKey: .costCtr)
//		costCtrWebScopeIDs = try values.decodeIfPresent([String].self, forKey: .costCtrWebScopeIDs)
//		primarySchoolNets = try values.decodeIfPresent([String].self, forKey: .primarySchoolNets)
//		schools = try values.decodeIfPresent([String].self, forKey: .schools)
//		mtrs = try values.decodeIfPresent([String].self, forKey: .mtrs)
//		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
//		size = try values.decodeIfPresent(Int.self, forKey: .size)
//		autoCompleteZoomToBottomLayer = try values.decodeIfPresent(Bool.self, forKey: .autoCompleteZoomToBottomLayer)
//		sort = try values.decodeIfPresent(String.self, forKey: .sort)
//		order = try values.decodeIfPresent(String.self, forKey: .order)
//		geoFilter = try values.decodeIfPresent(GeoFilter.self, forKey: .geoFilter)
//		geoNearBy = try values.decodeIfPresent(GeoNearBy.self, forKey: .geoNearBy)
//	}

}
