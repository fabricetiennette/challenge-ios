import Foundation

struct Bank: Codable, Equatable, Hashable {

    let name: String?
    let logoURL: String?

    enum CodingKeys: String, CodingKey {
        case name
        case logoURL = "logo_url"
    }
}
