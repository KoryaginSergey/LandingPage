//
//  TestViewController.swift
//  Landing Page
//
//  Created by macuser on 23.08.2021.
//  
//

import UIKit

// MARK: - TestViewController

class TestViewController: UIViewController {

    var model: TestModelProtocol

    fileprivate var tempView: TestViewProtocol?
    var customView: TestViewProtocol! {
        return self.view as? TestViewProtocol
    }

    // MARK: Initializers

    init(withView view: TestViewProtocol, model: TestModelProtocol) {
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
        
        
        self.customView.backgroundColor = self.model.color
    }

    // MARK: - Private methods

}

// MARK: - TestViewDelegate

extension TestViewController: TestViewDelegate {

    func viewSomeAction(view: TestViewProtocol) {
    }
}

// MARK: - TestModelDelegate

extension TestViewController: TestModelDelegate {

}
