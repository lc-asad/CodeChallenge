//
//  RegistrationViewModel.swift
//  CodeChallenge
//
//  Created by Abu Hamdan on 11/16/21.
//

import Foundation
import RxSwift

struct RegistrationViewModel {
    
    let fullNamePublishSubject = PublishSubject<String>()
    let emailPublishSubject = PublishSubject<String>()
    let phoneNumberPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(fullNamePublishSubject.asObservable().startWith(""), emailPublishSubject.asObservable().startWith(""),
                                        phoneNumberPublishSubject.asObservable().startWith("")).map {fullname, email, phoneNumber in
            return !(fullname.isEmpty) &&
                (Utilities.shared.validateEmail(email: email) &&
                  !(phoneNumber.isEmpty))
        }
    }

}
