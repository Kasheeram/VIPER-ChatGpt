//
//  Protocols.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation



// View
protocol UserListViewProtocol: AnyObject {
    func showUsers(_ users: [User])
    func showError(message: String)
}

// Presenter
protocol UserListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func didSelectUser(_ user: User)
}

// Interactor
protocol UserListInteractorProtocol: AnyObject {
    var presenter: UserListPresenterProtocol? { get set }
    func fetchUsers()
}


// Router
protocol UserListRouterProtocol: AnyObject {
    static func createUserListModule() -> UserListViewController
    func navigateToUserDetails(with user: User)
    
}


// Error enum
enum FetchError: Error {
    case failed
}
