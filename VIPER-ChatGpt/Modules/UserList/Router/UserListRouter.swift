//
//  UserListRouter.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation
import UIKit

// Entry point

class UserListRouter: UserListRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createUserListModule() -> UserListViewController {
        
        let view = UserListViewController()
        let interactor = UserListInteractor()
        let presenter = UserListPresenter(view: view, interactor: interactor, router: UserListRouter(viewController: view))
        
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    func navigateToUserDetails(with user: User) {
        let userDetailsViewController = UserDetailsRouter.createUserDetailModule(with: user)
        viewController?.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
    
}
