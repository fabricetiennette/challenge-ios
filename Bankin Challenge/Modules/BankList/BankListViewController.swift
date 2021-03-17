import UIKit

class BankListViewController: UIViewController, Storyboarded {

    var viewModel: BankListViewModel?

    private let bankCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var bankDataSource = BankDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bankCollectionView)

        setupCollectionView()
        setupBindings()
    }
}

    // MARK: - Private Methods

private extension BankListViewController {

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
        setupConstraints()
        let nibCell = UINib(nibName: "BankCollectionViewCell", bundle: nil)
        bankCollectionView.register(nibCell, forCellWithReuseIdentifier: "BankCollectionViewCell")
        bankCollectionView.dataSource = bankDataSource
        bankCollectionView.delegate = bankDataSource
        bankCollectionView.backgroundColor = .white
        bankCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    func setupConstraints() {
        bankCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bankCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            bankCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bankCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bankCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
