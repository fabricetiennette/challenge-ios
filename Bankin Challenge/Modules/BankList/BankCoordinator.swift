import UIKit

class BankCoordinator: Coordinator<UIViewController> {

    enum Options {
        case present(UIViewController, style: UIModalPresentationStyle)
        case push(UINavigationController)
    }

    private let options: Options
    private let banks: [Bank?]

    init(banks: [Bank?], options: Options) {
        self.banks = banks
        self.options = options
        switch options {
        case let .present(viewController, style: _):
            super.init(rootView: viewController)
        case let .push(navigationController):
            super.init(rootView: navigationController)
        }
    }

    var delegate: CountryListViewModelDelegate?

    override func start() {
        DispatchQueue.main.async {
            let viewModel = BankListViewModel(banks: self.banks)
            let bankListViewController = BankListViewController.instantiate(from: "Main")
            bankListViewController.viewModel = viewModel

            switch self.options {
            case let .present(viewController, style):
                let navigationController = UINavigationController(rootViewController: bankListViewController)
                navigationController.modalPresentationStyle = style
                viewController.present(navigationController, animated: true)
                
            case let .push(navigationController):
                navigationController.pushViewController(bankListViewController, animated: true)
            }
        }
    }
}
