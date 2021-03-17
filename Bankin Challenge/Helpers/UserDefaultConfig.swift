import Foundation

struct UserDefaultConfig {
    @UserDefault("country", defaultValue: [])
    static var country: [Country] 
}
