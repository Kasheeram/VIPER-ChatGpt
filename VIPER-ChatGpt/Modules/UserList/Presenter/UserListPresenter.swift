//
//  UserListPresenter.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


class UserListPresenter: UserListPresenterProtocol {
   
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorProtocol!
    var router: UserListRouterProtocol
    
    init(view: UserListViewProtocol, interactor: UserListInteractorProtocol, router: UserListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad() {
        interactor.fetchUsers()
    }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.showUsers(users)
        case .failure(let error):
            view?.showError(message: error.localizedDescription)
        }
    }
    
    func didSelectUser(_ user: User) {
        router.navigateToUserDetails(with: user)
    }
    
    
    
}
