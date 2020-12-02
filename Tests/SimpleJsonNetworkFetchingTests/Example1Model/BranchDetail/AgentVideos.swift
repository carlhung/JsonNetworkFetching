/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AgentVideos : Codable {
	let vdo360URL : String?
	let vdo480URL : String?
	let vdo720URL : String?
	let vdoThumbnailURL : String?
	let stfRanking : Int?
	let stfNo : String?

	enum CodingKeys: String, CodingKey {

		case vdo360URL = "vdo360URL"
		case vdo480URL = "vdo480URL"
		case vdo720URL = "vdo720URL"
		case vdoThumbnailURL = "vdoThumbnailURL"
		case stfRanking = "stfRanking"
		case stfNo = "stfNo"
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