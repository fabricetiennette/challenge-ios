import UIKit

protocol BankCollectionViewDelegate: AnyObject {
    func setImage(with url: String, imageView: UIImageView)
}

class BankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankLabel: UILabel!

    weak var delegate: BankCollectionViewDelegate?

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        bankImageView.image = nil
        bankLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 6
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        bankImageView.clipsToBounds = true
    
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }

    func configureCell(with bank: Bank?) {
        guard let bank = bank else { return }
        if let url = bank.logoURL {
            delegate?.setImage(with: url, imageView: bankImageView)
        }
        bankLabel.text = bank.name
    }
}
