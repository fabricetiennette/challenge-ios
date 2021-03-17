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
        bankDataSource.imageHandler = { url, imageView in
            DispatchQueue.main.async {
                viewModel.fetchImage(url: url, imageView: imageView)
            }
        }
    }

    func setupCollectionView() {
        bankCollectionView.dataSource = bankDataSource
        bankCollectionView.delegate = bankDataSource
        bankCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}
