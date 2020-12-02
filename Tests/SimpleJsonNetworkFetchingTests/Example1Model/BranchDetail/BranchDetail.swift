/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct BranchDetail : Codable {
	let name : String?
	let address : String?
	let phone : String?
	let agentCount : Int?
	let saleCount : Int?
	let rentCount : Int?
	let newPropertyCount : Int?
	let thumbnail : String?
	let scope : Scope?
	let agents : [Agents]?
	let salePosts : [SalePosts]?
	let rentPosts : [RentPosts]?
	let newProperties : [NewProperties]?
	let regions : [Regions]?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case address = "address"
		case phone = "phone"
		case agentCount = "agentCount"
		case saleCount = "saleCount"
		case rentCount = "rentCount"
		case newPropertyCount = "newPropertyCount"
		case thumbnail = "thumbnail"
		case scope = "scope"
		case agents = "agents"
		case salePosts = "salePosts"
		case rentPosts = "rentPosts"
		case newProperties = "newProperties"
		case regions = "regions"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		agentCount = try values.decodeIfPresent(Int.self, forKey: .agentCount)
		saleCount = try values.decodeIfPresent(Int.self, forKey: .saleCount)
		rentCount = try values.decodeIfPresent(Int.self, forKey: .rentCount)
		newPropertyCount = try values.decodeIfPresent(Int.self, forKey: .newPropertyCount)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		scope = try values.decodeIfPresent(Scope.self, forKey: .scope)
		agents = try values.decodeIfPresent([Agents].self, forKey: .agents)
		salePosts = try values.decodeIfPresent([SalePosts].self, forKey: .salePosts)
		rentPosts = try values.decodeIfPresent([RentPosts].self, forKey: .rentPosts)
		newProperties = try values.decodeIfPresent([NewProperties].self, forKey: .newProperties)
		regions = try values.decodeIfPresent([Regions].self, forKey: .regions)
	}

}
