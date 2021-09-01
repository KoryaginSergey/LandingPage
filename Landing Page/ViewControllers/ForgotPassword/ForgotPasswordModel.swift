//
//  ForgotPasswordModel.swift
//  Landing Page
//
//  Created by macuser on 25.08.2021.
//  
//

import UIKit

// MARK: - ForgotPasswordModelDelegate

protocol ForgotPasswordModelDelegate: class {
  
}

// MARK: - ForgotPasswordModelProtocol

protocol ForgotPasswordModelProtocol: class {
  
  var currentState: TextInputFieldView.State { get }
  var delegate: ForgotPasswordModelDelegate? { get set }
}

// MARK: - ForgotPasswordModel

class ForgotPasswordModel: ForgotPasswordModelProtocol {
  let currentState: TextInputFieldView.State = .init(title: "email".uppercased(), leftImage: (UIImage(named: "mail")?.withTintColor(UIColor.init(red: 68/255, green: 20/255, blue: 214/255, alpha: 1.0), renderingMode: .alwaysOriginal))!, textPlaceholder: "enter your email")
  
  // MARK: - ForgotPasswordModel methods
  
  weak var delegate: ForgotPasswordModelDelegate?
  
  /** Implement ForgotPasswordModel methods here */
  
  
  // MARK: - Private methods
  
  /** Implement private methods here */
  
}

