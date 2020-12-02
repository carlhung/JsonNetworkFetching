/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Agents : Codable {
	let agentNo : String?
	let nameC : String?
	let nameE : String?
	let license : String?
	let thumbnail : String?
	let branchName : String?
	let address : String?
	let costCtr : String?
	let chattable : Bool?
	let canWeChat : Bool?
	let canWhatsApp : Bool?
	let phone : String?
	let phone2 : String?
	let awardCount : Int?
	let totalPostCount : Int?
	let star : Double?
	let whatsAppInfo : WhatsAppInfo?

	enum CodingKeys: String, CodingKey {

		case agentNo = "agentNo"
		case nameC = "nameC"
		case nameE = "nameE"
		case license = "license"
		case thumbnail = "thumbnail"
		case branchName = "branchName"
		case address = "address"
		case costCtr = "costCtr"
		case chattable = "chattable"
		case canWeChat = "canWeChat"
		case canWhatsApp = "canWhatsApp"
		case phone = "phone"
		case phone2 = "phone2"
		case awardCount = "awardCount"
		case totalPostCount = "totalPostCount"
		case star = "star"
		case whatsAppInfo = "whatsAppInfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		agentNo = try values.decodeIfPresent(String.self, forKey: .agentNo)
		nameC = try values.decodeIfPresent(String.self, forKey: .nameC)
		nameE = try values.decodeIfPresent(String.self, forKey: .nameE)
		license = try values.decodeIfPresent(String.self, forKey: .license)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		branchName = try values.decodeIfPresent(String.self, forKey: .branchName)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		costCtr = try values.decodeIfPresent(String.self, forKey: .costCtr)
		chattable = try values.decodeIfPresent(Bool.self, forKey: .chattable)
		canWeChat = try values.decodeIfPresent(Bool.self, forKey: .canWeChat)
		canWhatsApp = try values.decodeIfPresent(Bool.self, forKey: .canWhatsApp)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		phone2 = try values.decodeIfPresent(String.self, forKey: .phone2)
		awardCount = try values.decodeIfPresent(Int.self, forKey: .awardCount)
		totalPostCount = try values.decodeIfPresent(Int.self, forKey: .totalPostCount)
		star = try values.decodeIfPresent(Double.self, forKey: .star)
		whatsAppInfo = try values.decodeIfPresent(WhatsAppInfo.self, forKey: .whatsAppInfo)
	}

}
