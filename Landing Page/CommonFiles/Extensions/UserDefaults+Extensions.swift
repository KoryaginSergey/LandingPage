//
//  UserDefaults+Extensions.swift
//  Landing Page
//
//  Created by macuser on 30.08.2021.
//

import Foundation


private let userEmailAddressKey = "UserEmailAddressKey"


extension UserDefaults {
    
    static var isUserHaveEmail: Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey: userEmailAddressKey)
            UserDefaults.standard.synchronize()
        }
        
        get {
            return UserDefaults.standard.value(forKey: userEmailAddressKey) as? Bool
        }
    }
    
  
}




