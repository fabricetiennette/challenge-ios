import Foundation

struct ListResource: Codable {
    let resources: [Country]
}

struct Country: Codable {

    let countryCode: String?
    let parentBanks: [Bank?]

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case parentBanks = "parent_banks"
    }
}
