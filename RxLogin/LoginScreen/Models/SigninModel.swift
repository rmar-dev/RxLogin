//
//  SigninModel.swift
//  RxLogin
//
//  Created by Ricardo Rabeto on 10/06/2018.
//  Copyright © 2018 Ricardo Rabeto. All rights reserved.
//

import Foundation

class SigninModel {
    var email: String = ""
    var password: String = ""
    convenience init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
}
