import Foundation

struct ListResource: Codable {
    let resources: [Country]
}

struct Country: Codable, Hashable {
    
    let countryCode: String?
    let parentBanks: [Bank?]

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case parentBanks = "parent_banks"
    }

    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.countryCode == rhs.countryCode && lhs.parentBanks == rhs.parentBanks
    }
}
