//
//  LoginViewController.swift
//  RxLogin
//
//  Created by Ricardo Rabeto on 10/06/2018.
//  Copyright © 2018 Ricardo Rabeto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnableLabel: UILabel!
    
    var bag = DisposeBag()
    var loginViewModel: LoginViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //emailTextField.rx.bind(with: loginViewModel.emailFieldViewModel)
        _ = emailTextField.rx.text.map { $0 ?? "" }.bind(with:loginViewModel.emailFieldViewModel)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to:loginViewModel.passwordFieldViewModel)
        
        _ = loginViewModel.isValid.bind(to:loginButton.rx.isEnabled)
        
        loginViewModel.isValid
            .subscribe(onNext:{ [weak self] isValid in
                self?.loginEnableLabel.text = isValid ? "Enable" : "Not Enabled"
                self?.loginEnableLabel.textColor = isValid ? .green : .red
                print("is valid =\(isValid)")
            })
            .disposed(by: bag)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
