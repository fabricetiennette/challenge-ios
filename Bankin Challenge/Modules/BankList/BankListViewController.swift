import UIKit

class BankListViewController: UIViewController, Storyboarded {

    var viewModel: BankListViewModel?

    @IBOutlet weak var bankCollectionView: UICollectionView!

    private lazy var bankDataSource = BankDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupBindings()
    }

    func setupBindings() {
        guard let viewModel = viewModel else { return }
        DispatchQueue.main.async {
            self.bankDataSource.update(with: viewModel.banks)
            self.bankCollectionView.reloadData()
        }
    }

    func setupCollectionView() {
        bankCollectionView.dataSource = bankDataSource
    }
}
