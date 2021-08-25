//
//  LoginViewController.swift
//  Landing Page
//
//  Created by macuser on 19.08.2021.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainTitleIconImageView: UIImageView!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var thirdTitleLabel: UILabel!
    
    @IBOutlet weak var viewForInputTextView: UIView!
    @IBOutlet weak var viewForInputUsernameView: UIView!
    @IBOutlet weak var viewForInputPasswordView: UIView!
    
    
    @IBOutlet weak var passwordRecoveryButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var scanQRCodeButton: UIButton!
    
    @IBOutlet weak var fieldForImageView: UIImageView!
    
    let myBlueColor = UIColor.init(red: 68/255, green: 20/255, blue: 214/255, alpha: 1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setValuesLoginViewController()
        
        
        let inputUsernameView: TextInputFieldView = TextInputFieldView.create()
        inputUsernameView.snapshot = .init(title: "username".uppercased(), leftImage: (UIImage(named: "user")?.withTintColor(myBlueColor, renderingMode: .alwaysOriginal))!, textPlaceholder: "your username")
        viewForInputUsernameView.addSubview(inputUsernameView)
        inputUsernameView.translatesAutoresizingMaskIntoConstraints = false
        inputUsernameView.layoutAttachAll(to: viewForInputUsernameView)
        
        let inputPasswordView: TextInputFieldView = TextInputFieldView.create()
        inputPasswordView.snapshot = .init(title: "Password".uppercased(), leftImage: (UIImage(named: "lock")?.withTintColor(myBlueColor, renderingMode: .alwaysOriginal))!, rightImage:(UIImage(named: "eye")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal))!, textPlaceholder: "your password")
        viewForInputPasswordView.addSubview(inputPasswordView)
        inputPasswordView.translatesAutoresizingMaskIntoConstraints = false
        inputPasswordView.layoutAttachAll(to: viewForInputPasswordView)
    }
    
    
    @IBAction func passwordRecoveryButton(_ sender: Any) {
        let myVC = ForgotPasswordBuilder.viewController()
        present(myVC, animated: true, completion: nil)
    }
    

    @IBAction func signInButton(_ sender: Any) {
        let testVc = TestBuilder.viewController(color: UIColor.green)
        present(testVc, animated: true, completion: nil)
    }
    
  
    @IBAction func scanQRCodeButton(_ sender: Any) {
    }
    
}

private extension LoginViewController {
    
    func setValuesLoginViewController() {
        mainTitleLabel.text = "Appella"
        mainTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)
        mainTitleIconImageView.image = UIImage(named: "piano1")
        secondTitleLabel.text = "Let's get started."
        secondTitleLabel.textColor = myBlueColor
        secondTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        thirdTitleLabel.text = "Make the school app your personal assistant"
        thirdTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        
        passwordRecoveryButton.tintColor = myBlueColor
        signInButton.backgroundColor = myBlueColor
        signInButton.layer.cornerRadius = 10
        scanQRCodeButton.tintColor = myBlueColor
        
        fieldForImageView.image = UIImage(named: "figure")
        
    }
    
    
}
