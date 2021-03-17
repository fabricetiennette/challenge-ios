import UIKit

protocol Storyboarded {}

extension Storyboarded where Self: UIViewController {

    static func instantiate(from storyboarded: String) -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboarded, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
