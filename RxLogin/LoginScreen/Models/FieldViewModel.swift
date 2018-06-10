//
//  FieldViewModel.swift
//  RxLogin
//
//  Created by Ricardo Rabeto on 10/06/2018.
//  Copyright © 2018 Ricardo Rabeto. All rights reserved.
//

import Foundation
import RxSwift

protocol VSFieldViewModel {
    
    var title: String { get }
    var errorMessage: String { get }
    
    // Observables
    var value: Variable<String> { get set }
    var errorValue: Variable<String?> { get}
    
    // Validation
    func validate() -> Bool
}

extension VSFieldViewModel {
    func validateSize(_ value: String, size: (min:Int, max:Int)) -> Bool {
        return (size.min...size.max).contains(value.count)
    }
    func validateString(_ value: String?, pattern: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", pattern)
        return test.evaluate(with: value)
    }

}
