import Alamofire
import AlamofireImage

class BankService {

    func getImage(_ url: String?, imageView: UIImageView) {
        guard let bankURL = URL(string: url!) else { return }
        imageView.af.setImage(withURL: bankURL)
    }
}
