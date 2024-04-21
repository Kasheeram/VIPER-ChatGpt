//
//  Protocols.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import Foundation


// Router
protocol UserDetailRouterProtocol: AnyObject {
    static func createUserDetailModule(with user: User) -> UserDetailController
}
