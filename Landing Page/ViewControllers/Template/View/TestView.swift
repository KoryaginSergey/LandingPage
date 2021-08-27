//
//  TestView.swift
//  Landing Page
//
//  Created by macuser on 23.08.2021.
//  
//

import UIKit

// MARK: - TestViewDelegate

protocol TestViewDelegate: class {

    func viewSomeAction(view: TestViewProtocol)
}

// MARK: - TestViewProtocol

protocol TestViewProtocol: UIView {

    var delegate: TestViewDelegate? { get set }
}

// MARK: - TestView

class TestView: UIView, TestViewProtocol {

    // MARK: - TestView interface methods

    weak var delegate: TestViewDelegate?

    // MARK: - Overrided methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - IBActions

    func someButtonAction() {

        self.delegate?.viewSomeAction(view: self)
    }
}
