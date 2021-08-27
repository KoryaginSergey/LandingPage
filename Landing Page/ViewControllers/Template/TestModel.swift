//
//  TestModel.swift
//  Landing Page
//
//  Created by macuser on 23.08.2021.
//  
//

import UIKit

// MARK: - TestModelDelegate

protocol TestModelDelegate: class {

}

// MARK: - TestModelProtocol

protocol TestModelProtocol: class {
    var color: UIColor { get }
    var delegate: TestModelDelegate? { get set }
}

// MARK: - TestModel

class TestModel: TestModelProtocol {
    var color: UIColor
    
    // MARK: - TestModel methods

    weak var delegate: TestModelDelegate?

    /** Implement TestModel methods here */

    init(color: UIColor) {
        self.color = color
    }

    // MARK: - Private methods

    /** Implement private methods here */

}

