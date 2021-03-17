import UIKit

final class CountryTableCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.masksToBounds = false
        countryImageView.clipsToBounds = true
    }

    private func setupCell() {
        selectionStyle = .none
    }

    func configureCell(country: Country) {
        if let countryCode = country.countryCode {
            countryLabel.text = loadCountryName(from: countryCode)
            countryImageView.image = loadImage(from: countryCode)
        }
    }
}

private extension CountryTableCell {

    func loadImage(from named: String) -> UIImage? {
        if let confirmedImage = UIImage(named: named) {
            return confirmedImage
        } else {
            return nil
        }
    }

    func loadCountryName(from countryCode: String) ->  String? {
        switch countryCode {
        case "FR":
            return "France"
        case "GB":
            return "United Kingdom"
        case "NL":
            return "Netherlands"
        case "ES":
            return "Spain"
        case "DE":
            return "Germany"
        default:
            return nil
        }
    }
}
