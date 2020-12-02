/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GetBranchFilterOptionsResponse : Codable {
	let route : Route?
	let count : Int?
	let data : [Data]?
	let geoJson : GeoJson?
	let detailUrl : String?
	let size : Int?

	enum CodingKeys: String, CodingKey {

		case route = "Route"
		case count = "Count"
		case data = "Data"
		case geoJson = "GeoJson"
		case detailUrl = "DetailUrl"
		case size = "Size"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		route = try values.decodeIfPresent(Route.self, forKey: .route)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		data = try values.decodeIfPresent([Data].self, forKey: .data)
		geoJson = try values.decodeIfPresent(GeoJson.self, forKey: .geoJson)
		detailUrl = try values.decodeIfPresent(String.self, forKey: .detailUrl)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
	}

}
