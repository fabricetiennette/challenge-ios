import Alamofire
import AlamofireImage

class BankListService {

    func getImage(_ url: String?, imageView: UIImageView) {
        guard let bankURL = URL(string: url!) else { return }
        imageView.af.setImage(withURL: bankURL)
    }
}
