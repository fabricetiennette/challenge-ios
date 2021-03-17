import UIKit

final class BankDataSource: NSObject {

    private var banks: [Bank?] = []
    var imageHandler: ((_ url: String, _ imageView: UIImageView) -> Void)?

    func update(with banks: [Bank?]) {
        self.banks = banks
    }
    
}

extension BankDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bank = banks[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankCollectionViewCell", for: indexPath) as! BankCollectionViewCell
        cell.delegate = self
        cell.configureCell(with: bank)
        return cell
    }
}

extension BankDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 15, right: 15)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let item = width - 45
        return CGSize(width: item / 2, height: width / 2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension BankDataSource: BankCollectionViewDelegate {
    func setImage(with url: String, imageView: UIImageView) {
        imageHandler?(url, imageView)
    }
}
