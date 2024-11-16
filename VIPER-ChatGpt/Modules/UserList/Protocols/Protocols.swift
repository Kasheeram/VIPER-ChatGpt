//
//  Protocols.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import UIKit


// View
protocol UserListViewProtocol: AnyObject {
    var presenter: UserListPresenterProtocol? { get set }
    func showUsers(_ users: [User])
    func showError(message: String)
}

// Interactor
protocol UserListInteractorInputProtocol: AnyObject {
    var presenter: UserListInteractorOutputProtocol? { get set }
    func fetchUsers()
}

protocol UserListInteractorOutputProtocol: AnyObject {
    func usersFetchedSuccessfully(users: [User])
    func usersFetchingFailed(with error: FetchError)
}

// Presenter
protocol UserListPresenterProtocol: AnyObject {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var router: UserListRouterProtocol? { get set }
    func viewDidLoad()
    func showUserDetails(_ user: User)
}

// Router
protocol UserListRouterProtocol: AnyObject {
    static func createUserListModule() -> UIViewController
    func navigateToUserDetails(from view: UserListViewProtocol, with user: User)
    
}


// Error enum
enum FetchError: Error {
    case failed
}
