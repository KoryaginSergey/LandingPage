//
//  ForgotPasswordBuilder.swift
//  Landing Page
//
//  Created by macuser on 25.08.2021.
//  
//

import UIKit


class ForgotPasswordBuilder: NSObject {
  
  class func viewController() -> ForgotPasswordViewController {
    let view: ForgotPasswordViewProtocol = ForgotPasswordView.create() as  ForgotPasswordViewProtocol
    let model: ForgotPasswordModelProtocol = ForgotPasswordModel()
    let viewController = ForgotPasswordViewController(withView: view, model: model)
    return viewController
  }
}

