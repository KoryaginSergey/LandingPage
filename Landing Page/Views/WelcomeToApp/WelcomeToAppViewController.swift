//
//  WelcomeToAppViewController.swift
//  Landing Page
//
//  Created by Admin on 30.08.2021.
//

import UIKit

class WelcomeToAppViewController: UIViewController {
    
    
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var secondTitleLabel: UILabel!
    @IBOutlet private weak var fieldForEmailLabel: UILabel!
    
    @IBOutlet private weak var logOutButton: UIButton!
    
    @IBOutlet private weak var imageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValuesWelcomeToAppViewController()

    }
   
    @IBAction func logOutButton(_ sender: Any) {
        UserDefaults.userEmail = nil
        UserDefaults.userPassword = nil
        NotificationCenter.default.post(name: .userDidSighOut, object: nil)
    }
    
}


private extension WelcomeToAppViewController {
    
    func setValuesWelcomeToAppViewController() {
        mainTitleLabel.text = "Welcome\nto\nAppella"
        mainTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)

        secondTitleLabel.text = "Your username"
        
        fieldForEmailLabel.text = UserDefaults.userEmail?.trimmingCharacters(in: .whitespaces)
        
        logOutButton.backgroundColor = myBlueColor
        logOutButton.layer.cornerRadius = 10
        
        imageImageView.image = UIImage(named: "back2")
    }
    
}
