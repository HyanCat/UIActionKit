//
//  ViewController.swift
//  UIActionKit
//
//  Created by HyanCat on 02/05/2018.
//  Copyright (c) 2018 HyanCat. All rights reserved.
//

import UIKit
import UIActionKit

extension ActionName {
    static let actionLabel = ActionName("actionLabel")
    static let actionA = ActionName("actionA")
}

class ViewController: UIViewController {

    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        actionLabel.action = Action(name: ActionName.actionLabel)
        buttonA.action = Action(name: ActionName.actionA)
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
        if actionA.name == ActionName.actionA {
            print("handled actionA.")
            self.buttonA.action = nil
        } else if actionA.name == ActionName.actionLabel {
            print("handle action label.")
            self.actionLabel.action = nil
        }
        return Result.end
    }
}

