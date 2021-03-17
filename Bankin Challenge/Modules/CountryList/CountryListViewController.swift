import UIKit

class CountryListViewController: UIViewController, Storyboarded {

    @IBOutlet weak var countryTableView: UITableView!

    var viewModel: CountryListViewModel?
    private lazy var countryDataSource = CountryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select a country"

        setupTableView()
        setupBindings()
    }
}

// MARK: - Private Methods

private extension CountryListViewController {

    func setupBindings() {
        guard let viewModel = viewModel else { return }
        viewModel.countriesHandler = { [weak self] countries in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.countryDataSource.update(with: countries)
                self.countryTableView.reloadData()
            }
        }
        countryDataSource.didTapHandler = { [weak self] country in
            guard let self = self else { return }
            self.viewModel?.dipTapOn(country)
        }
        viewModel.getCountry()
    }

    func setupTableView() {
        countryTableView.separatorStyle = .none
        countryTableView.dataSource = countryDataSource
        countryTableView.delegate = countryDataSource
    }
}
