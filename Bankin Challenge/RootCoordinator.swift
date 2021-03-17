import Foundation
import UIKit

class RootCoordinator: Coordinator<UIWindow> {

    // MARK: - Initializer

    override func start() {
        let navigationController = UINavigationController()
        rootView.rootViewController = navigationController
        let coordinator = CountryListCoordinator(rootView: navigationController)
        add(children: coordinator)
        rootView.makeKeyAndVisible()
        coordinator.start()
    }
}
