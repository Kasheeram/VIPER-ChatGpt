//
//  UserListInteractor.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


class UserListInteractor: UserListInteractorProtocol {
    weak var presenter: UserListPresenterProtocol?
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil  else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }.resume()
    }
    
    
}
