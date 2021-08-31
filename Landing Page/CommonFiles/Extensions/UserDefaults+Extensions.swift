//
//  UserDefaults+Extensions.swift
//  Landing Page
//
//  Created by macuser on 30.08.2021.
//

import Foundation


private let userEmailAddressKey = "UserEmailAddressKey"
private let userPasswordKey = "UserPasswordKey"


extension UserDefaults {
    
    static var userEmail: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: userEmailAddressKey)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.value(forKey: userEmailAddressKey) as? String
        }
    }
    
    static var userPassword: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: userPasswordKey)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.value(forKey: userPasswordKey) as? String
        }
    }
    
    
  
}




