//
//  UserListInteractor.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
   
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            presenter?.usersFetchingFailed(with: FetchError.failed)
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil  else {
                self?.presenter?.usersFetchingFailed(with: FetchError.failed)
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.usersFetchedSuccessfully(users: entities)
            } catch {
                self?.presenter?.usersFetchingFailed(with: FetchError.failed)
            }
        }.resume()
    }
    
    
}
