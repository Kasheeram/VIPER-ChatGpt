//
//  UserDetailController.swift
//  VIPER-ChatGpt
//
//  Created by kashee on 21/04/24.
//

import UIKit

class UserDetailController: UIViewController {
    
    var user: User?
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 40)
        label.center = view.center
        label.text = user?.name
    }

}
