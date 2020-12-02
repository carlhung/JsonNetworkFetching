/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Scope : Codable {
	let scp_mkt : String?
	let terr : String?
	let db_code : String?
	let db : String?
	let webScopeID : String?
	let webScope : String?
	let hma_id : String?
	let hma : String?
	let hmaDesc : String?
	let hmaThumbnail : String?

	enum CodingKeys: String, CodingKey {

		case scp_mkt = "scp_mkt"
		case terr = "terr"
		case db_code = "db_code"
		case db = "db"
		case webScopeID = "webScopeID"
		case webScope = "webScope"
		case hma_id = "hma_id"
		case hma = "hma"
		case hmaDesc = "hmaDesc"
		case hmaThumbnail = "hmaThumbnail"
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