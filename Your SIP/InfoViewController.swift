//
//  InfoViewController.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/11/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var wannaStartButton: UIButton!
    @IBOutlet var textInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        wannaStartButton.layer.cornerRadius = wannaStartButton.frame.size.height / 2
        let sometext =  Texts()
        textInfoLabel.text = sometext.info
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
