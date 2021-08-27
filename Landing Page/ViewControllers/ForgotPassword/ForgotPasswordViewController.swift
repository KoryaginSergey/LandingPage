//
//  ForgotPasswordViewController.swift
//  Landing Page
//
//  Created by macuser on 25.08.2021.
//  
//

import UIKit


// MARK: - ForgotPasswordViewController

class ForgotPasswordViewController: UIViewController {

    var model: ForgotPasswordModelProtocol

    fileprivate var tempView: ForgotPasswordViewProtocol?
    var customView: ForgotPasswordViewProtocol! {
        return self.view as? ForgotPasswordViewProtocol
    }

    // MARK: Initializers

    init(withView view: ForgotPasswordViewProtocol, model: ForgotPasswordModelProtocol) {
        self.model = model
        self.tempView = view

        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("This class needs to be initialized with init(withView:model:) method")
    }

    // MARK: - View life cycle

    override func loadView() {
        super.loadView()

        self.view = self.tempView
        self.tempView = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self
        model.delegate = self
        
        customView.setState(model.currentState)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture() {
        view.endEditing(true)
    }

    // MARK: - Private methods

}

// MARK: - ForgotPasswordViewDelegate

extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
    
    func viewContinueAction(view: ForgotPasswordViewProtocol) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - ForgotPasswordModelDelegate

extension ForgotPasswordViewController: ForgotPasswordModelDelegate {

}
