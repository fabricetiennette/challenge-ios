import Foundation
import UIKit

class CountryListCoordinator: Coordinator<UINavigationController> {

    override func start() {
        DispatchQueue.main.async {
            let countrylistViewController = CountryListViewController.instantiate(from: "Main")
            let countrylistViewModel = CountryListViewModel()
            countrylistViewModel.delegate = self
            countrylistViewController.viewModel = countrylistViewModel
            self.rootView.pushViewController(countrylistViewController, animated: true)
        }
    }
}

extension CountryListCoordinator: CountryListViewModelDelegate {

    func didTap(on bank: [Bank?]) {
        let coordinator = BankListCoordinator(banks: bank, options: .push(rootView))
        add(children: coordinator)
        coordinator.start()
    }
}
