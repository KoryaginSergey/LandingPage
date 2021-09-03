//
//  LoginViewController.swift
//  Landing Page
//
//  Created by macuser on 19.08.2021.
//

import UIKit


class LoginViewController: UIViewController {
  
  @IBOutlet private weak var mainTitleLabel: UILabel!
  @IBOutlet private weak var mainTitleIconImageView: UIImageView!
  @IBOutlet private weak var secondTitleLabel: UILabel!
  @IBOutlet private weak var thirdTitleLabel: UILabel!
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var viewForInputTextView: UIView!
  @IBOutlet private weak var viewForInputUsernameView: UIView!
  @IBOutlet private weak var viewForInputPasswordView: UIView!
  @IBOutlet private weak var passwordRecoveryButton: UIButton!
  @IBOutlet private weak var signInButton: UIButton!
  @IBOutlet private weak var scanQRCodeLabel: UILabel!
  @IBOutlet private weak var fieldForImageView: UIImageView!
  private var emailTextView: TextInputFieldView?
  private var passwordTextView: TextInputFieldView?
  private let stringLinkForTapGesture = "scan QR code"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setValuesLoginViewController()
    setupQRCodeLabel()
    setupGestureRecognizers()
    
    let inputUsernameView: TextInputFieldView = TextInputFieldView.create()
    inputUsernameView.snapshot = .init(title: "username".uppercased(), leftImage: (UIImage(named: "user")?.withTintColor(myBlueColor, renderingMode: .alwaysOriginal))!, textPlaceholder: "your username")
    viewForInputUsernameView.addSubview(inputUsernameView)
    inputUsernameView.translatesAutoresizingMaskIntoConstraints = false
    inputUsernameView.layoutAttachAll(to: viewForInputUsernameView)
    emailTextView = inputUsernameView
    
    let inputPasswordView: TextInputFieldView = TextInputFieldView.create()
    inputPasswordView.snapshot = .init(title: "password".uppercased(), leftImage: (UIImage(named: "lock")?.withTintColor(myBlueColor, renderingMode: .alwaysOriginal))!, rightImage:(UIImage(named: "eye")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal))!, textPlaceholder: "your password")
    viewForInputPasswordView.addSubview(inputPasswordView)
    inputPasswordView.translatesAutoresizingMaskIntoConstraints = false
    inputPasswordView.layoutAttachAll(to: viewForInputPasswordView)
    passwordTextView = inputPasswordView
  }
  
  @objc func tapGesture() {
    view.endEditing(true)
  }
  
  @IBAction func passwordRecoveryButton(_ sender: Any) {
    let myVC = ForgotPasswordBuilder.viewController()
    present(myVC, animated: true, completion: nil)
  }
  
  @IBAction func signInButton(_ sender: Any) {
    guard let emailText = emailTextView?.text, !emailText.isEmpty  else {
      showAlert(message: "Invalid email")
      return
    }
    guard let passwordText = passwordTextView?.text, !passwordText.isEmpty else {
      showAlert(message: "Invalid password")
      return
    }
    UserDefaults.userEmail = emailText
    NotificationCenter.default.post(name: .userDidSighIn, object: nil)
  }
}

private extension LoginViewController {
  
  func setValuesLoginViewController() {
    mainTitleLabel.text = "Appella"
    mainTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)
    mainTitleIconImageView.image = UIImage(named: "piano2")
    secondTitleLabel.text = "Let's get started."
    secondTitleLabel.textColor = myBlueColor
    secondTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
    thirdTitleLabel.text = "Make the school app \nyour personal assistant"
    thirdTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .thin)
    passwordRecoveryButton.tintColor = myBlueColor
    signInButton.backgroundColor = myBlueColor
    signInButton.layer.cornerRadius = 10
    fieldForImageView.image = UIImage(named: "back2")
  }
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: "Attention", message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,
                                  handler: {(_: UIAlertAction!) in
                                  }))
    self.present(alert, animated: true, completion: nil)
  }
  
  func setupQRCodeLabel() {
    let attributedString = NSMutableAttributedString()
    let firstString = NSAttributedString(string: "or", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular),
                                                                    NSAttributedString.Key.foregroundColor : UIColor.black])
    let spaceString = NSAttributedString(string: " ")
    let secondString = NSAttributedString(string: stringLinkForTapGesture, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular),
                                                                    NSAttributedString.Key.foregroundColor : myBlueColor])
    attributedString.append(firstString)
    attributedString.append(spaceString)
    attributedString.append(secondString)
    scanQRCodeLabel.attributedText = attributedString
  }
  
  func setupGestureRecognizers() {
    scanQRCodeLabel.isUserInteractionEnabled = true
    scanQRCodeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(qrCodeTapAction(gesture:))))
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc func qrCodeTapAction(gesture: UITapGestureRecognizer) {
    let text = self.scanQRCodeLabel.text as NSString?
    guard let labelText = text else {return}
    let range = labelText.range(of: stringLinkForTapGesture)
    let result = gesture.didTapAttributedTextInLabel(label: self.scanQRCodeLabel, inRange: range)
    if result {
      showAlert(message: "You choosed scan QR code")
    }
  }
  
}
