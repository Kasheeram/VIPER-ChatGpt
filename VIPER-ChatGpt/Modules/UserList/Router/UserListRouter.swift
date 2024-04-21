//
//  UserListRouter.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


// Entry point

class UserListRouter: UserListRouterProtocol {
    
    static func createUserListModule() -> UserListViewController {
        
        let view = UserListViewController()
        let interactor = UserListInteractor()
        let presenter = UserListPresenter(view: view, interactor: interactor, router: UserListRouter())
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
//    func navigateToUserDetails(with user: User) {
////            let userDetailsViewController = UserDetailsRouter.createUserDetailsModule(with: user)
////            viewController?.navigationController?.pushViewController(userDetailsViewController, animated: true)
//        }
    
    
}
