import UIKit

final class CountryDataSource: NSObject {

    var didTapHandler: ((_ countrySelected: Country) -> Void)?
    private var countries: [Country] = []

    func update(with countries: [Country]) {
        self.countries = countries
    }
}

extension CountryDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableCell", for: indexPath) as! CountryTableCell
        cell.configureCell(country: country)
        return cell
    }
}

extension CountryDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < countries.count else { return }
        didTapHandler?(countries[indexPath.row])
    }
}
