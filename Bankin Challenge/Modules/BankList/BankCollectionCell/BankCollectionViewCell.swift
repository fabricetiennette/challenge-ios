import UIKit

class BankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.masksToBounds = false
        bankImageView.clipsToBounds = true
    }

    func configureCell(with bank: Bank?) {
        guard let bank = bank else { return }
        if let url = bank.logoURL {
            bankImageView.load(url: URL(string: url)!)
        }
        bankLabel.text = bank.name
    }
}
