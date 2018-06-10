//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by Ricardo Rabeto on 10/06/2018.
//  Copyright © 2018 Ricardo Rabeto. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    let model: SigninModel
    private let disposeBag = DisposeBag()
    
    let emailFieldViewModel = VSEmailViewModel()
    let passwordFieldViewModel = VSPasswordViewModel()
    
    // RX
    let isLoading = Variable(false)
    var isSuccess = Variable(false)
    var errorMessage = Variable<String?>(nil)
    
    init(model: SigninModel) {
        self.model = model
    }
    
    func validForm() -> Bool {
        return emailFieldViewModel.validate() && passwordFieldViewModel.validate()
    }
    
    /*
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()){ email, password in
                email.count >= 3 && password.count >= 3
            }
    }*/
}
