import UIKit

final class BankDataSource: NSObject {

    private var banks: [Bank?] = []

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
        cell.configureCell(with: bank)
        return cell
    }
}

extension BankDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
            let twoItem = width - 45
            return CGSize(width: twoItem / 2, height: twoItem / 2)
    }
}
