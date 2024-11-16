//
//  UserListPresenter.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


class UserListPresenter: UserListPresenterProtocol, UserListInteractorOutputProtocol {
   
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    var router: UserListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchUsers()
    }
    
    func usersFetchedSuccessfully(users: [User]) {
        view?.showUsers(users)
    }
    
    func usersFetchingFailed(with error: FetchError) {
        view?.showError(message: error.localizedDescription)
    }
    
    func showUserDetails(_ user: User) {
        guard let view = view else { return }
        router?.navigateToUserDetails(from: view, with: user)
    }
    
}
