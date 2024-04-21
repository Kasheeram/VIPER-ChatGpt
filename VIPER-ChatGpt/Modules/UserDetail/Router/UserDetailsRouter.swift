//
//  UserDetailsRouter.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


class UserDetailsRouter: UserDetailRouterProtocol {
    static func createUserDetailModule(with user: User) -> UserDetailController {
        let view = UserDetailController(user: user)
//        let interactor = UserDetailInteractor()
//        let presenter = UserDetailPresenter(view: view, interactor: interactor, router: UserDetailsRouter())
//
//        view.presenter = presenter
//        interactor.presenter = presenter
        return view
    }
    
    
}
