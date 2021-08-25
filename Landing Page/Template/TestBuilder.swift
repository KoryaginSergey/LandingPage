//
//  TestBuilder.swift
//  Landing Page
//
//  Created by macuser on 23.08.2021.
//  
//

import UIKit

class TestBuilder: NSObject {

    class func viewController(color: UIColor) -> TestViewController {

        let view: TestViewProtocol = TestView.create() as  TestViewProtocol
        let model: TestModelProtocol = TestModel(color: color)

        let viewController = TestViewController(withView: view, model: model)
        return viewController
    }

}

