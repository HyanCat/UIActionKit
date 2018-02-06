//
//  ViewController.swift
//  UIActionKit
//
//  Created by HyanCat on 02/05/2018.
//  Copyright (c) 2018 HyanCat. All rights reserved.
//

import UIKit
import UIActionKit

class ViewController: UIViewController {

    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        actionLabel.action = Action(name: "actionLabel")
        buttonA.action = Action(name: "actionA")
    }

    @objc
    override func handleAction(_ action: Action) -> Result {
        print("handled action.")
        return Result.end
    }

    @objc(handleActionLabel:)
    func handle(actionLabel: Action) -> Result? {
        print("handle action label.")
        self.actionLabel.action = nil
        return nil
    }

    @objc(handleActionA:)
    func handle(actionA: Action) -> Result {
        print("handled hahah.")
        self.buttonA.action = nil
        return Result.end
    }
}

