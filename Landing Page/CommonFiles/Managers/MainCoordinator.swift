//
//  MainCoordinator.swift
//  Landing Page
//
//  Created by macuser on 31.08.2021.
//

import Foundation
import UIKit
import UIWindowTransitions


class MainCoordinator {
  
  private var window: UIWindow?
  
  init(window: UIWindow) {
    self.window = window
    configure(isFirstlaunch: true)
    NotificationCenter.default.addObserver(self, selector: #selector(userDidSignUpHandler), name: .userDidSighIn, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(userDidSignOutHandler), name: .userDidSighOut, object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}

private extension MainCoordinator {
  
  func configure(isFirstlaunch: Bool) {
    let options = UIWindow.TransitionOptions()
    options.direction = .toBottom
    options.duration = isFirstlaunch ? 0.01 : 0.2
    let vc = getRootViewController()
    window?.set(rootViewController: vc!, options: options, nil)
    window?.makeKeyAndVisible()
  }
  
  func getRootViewController() -> UIViewController? {
    guard let userEmail = UserDefaults.userEmail, !userEmail.isEmpty else {
      return LoginViewController()
    }
    return WelcomeToAppViewController()
  }
  
  @objc
  func userDidSignUpHandler() {
    self.configure(isFirstlaunch: false)
  }
  
  @objc
  func userDidSignOutHandler() {
    self.configure(isFirstlaunch: false)
  }
}
