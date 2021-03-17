import UIKit

final class BankListViewModel {

    let banks: [Bank?]

    let bankService: BankService

    init(banks: [Bank?], bankService: BankService = .init()) {
        self.banks = banks
        self.bankService = bankService
    }

    func fetchImage(url: String, imageView: UIImageView) {
        bankService.getImage(url, imageView: imageView)
    }
}
