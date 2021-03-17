import Foundation

protocol CountryListViewModelDelegate: AnyObject {
    func didTap(on bank: [Bank?])
}

final class CountryListViewModel {

    weak var delegate: CountryListViewModelDelegate?

    private let countryListService: CountryListService

    var countriesHandler: ((_ countries: [Country]) -> Void)?

    init(countryListService: CountryListService = .init()) {
        self.countryListService = countryListService

        fetchCountryList()
    }

    private func fetchCountryList() {
        countryListService.getCountryList { result in
            switch result {
            case .success(let list):
                UserDefaultConfig.country = list.resources
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func dipTapOn(_ country: Country) {
        delegate?.didTap(on: country.parentBanks)
    }

    func getCountry() {
        var list = UserDefaultConfig.country
        _ = list.compactMap { country -> Country? in
            if country.countryCode == Locale.current.regionCode {
                list.insert(country, at: 0)
            }
            return nil
        }
        UserDefaultConfig.country = list
        countriesHandler?(list.unique())
    }
}
