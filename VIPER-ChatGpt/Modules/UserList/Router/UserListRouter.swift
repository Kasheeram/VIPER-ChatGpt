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
   
    static func createUserListModule() -> UIViewController {
        let view = UserListViewController()
        let interactor: UserListInteractorInputProtocol = UserListInteractor()
        let presenter: UserListPresenterProtocol & UserListInteractorOutputProtocol = UserListPresenter()
        let router: UserListRouterProtocol = UserListRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
    func navigateToUserDetails(from view: UserListViewProtocol, with user: User) {
        let userDetailsViewController = UserDetailsRouter.createUserDetailModule(with: user)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(userDetailsViewController, animated: true)
        }
        
    }
    
}
