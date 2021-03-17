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
    }

    func fetchCountryList() {
        countryListService.getCountryList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                self.countriesHandler?(list.resources)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func dipTapOn(_ country: Country) {
        delegate?.didTap(on: country.parentBanks)
    }
}
