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
    
    
    let myBlueColor = UIColor.init(red: 68/255, green: 20/255, blue: 214/255, alpha: 1.0)
    
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
    }
    
    public var snapshot: State? {
        didSet {
            updateUI()
        }
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
//        nameFieldLabel.adjustsFontSizeToFitWidth = true
//        nameFieldLabel.minimumScaleFactor = 0.1
    }
    
    func updateUI() {
        nameFieldLabel.text = snapshot?.title
        iconImageView.image = snapshot?.leftImage
        fieldForEyeImageView.image = snapshot?.rightImage
        fieldForInputTextField.placeholder = snapshot?.textPlaceholder
    }
    
}

