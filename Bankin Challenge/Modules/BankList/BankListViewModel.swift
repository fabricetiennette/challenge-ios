import UIKit

final class BankListViewModel {

    let banks: [Bank?]
    let bankService: BankListService

    init(banks: [Bank?], bankService: BankListService = .init()) {
        self.banks = banks
        self.bankService = bankService
    }

    func fetchImage(url: String, imageView: UIImageView) {
        bankService.getImage(url, imageView: imageView)
    }
}
