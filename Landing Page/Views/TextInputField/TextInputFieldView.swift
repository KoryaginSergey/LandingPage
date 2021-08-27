//
//  TextInputFieldView.swift
//  Landing Page
//
//  Created by macuser on 20.08.2021.
//

import UIKit


class TextInputFieldView: UIView {

    @IBOutlet private weak var nameFieldLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var fieldForInputTextField: UITextField!
    @IBOutlet private weak var fieldForEyeImageView: UIImageView!
    @IBOutlet private weak var borderLabel: UILabel!
    
    var eyeIsEnable = true
    
    public struct State {
        let title: String
        let leftImage: UIImage
        var rightImage: UIImage?
        let textPlaceholder: String
        
        init(title: String,
             leftImage: UIImage,
             rightImage: UIImage? = nil,
             textPlaceholder: String) {
            self.title = title
            self.leftImage = leftImage
            self.rightImage = rightImage
            self.textPlaceholder = textPlaceholder
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        fieldForInputTextField.delegate = self
    }
    
    @IBAction func selectEyeAction(_ sender: Any) {
        guard (snapshot?.rightImage) != nil else {return}
        if eyeIsEnable {
        snapshot?.rightImage = UIImage(named: "eye-slash")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        eyeIsEnable = false
        print("Hello World")
        } else {
            snapshot?.rightImage = UIImage(named: "eye")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
            eyeIsEnable = true
        }
    }
    
       public var snapshot: State? {
        didSet {
            updateUI()
        }
    }
}


extension TextInputFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

private extension TextInputFieldView {
    
    func setupUI() {
        nameFieldLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        nameFieldLabel.numberOfLines = 1
        nameFieldLabel.textAlignment = .left
        nameFieldLabel.textColor = myBlueColor
        borderLabel.layer.borderWidth = 1
        borderLabel.layer.borderColor = UIColor.placeholderText.cgColor
    }
    
    func updateUI() {
        nameFieldLabel.text = snapshot?.title
        iconImageView.image = snapshot?.leftImage
        fieldForEyeImageView.image = snapshot?.rightImage
        fieldForInputTextField.placeholder = snapshot?.textPlaceholder
    }
}

