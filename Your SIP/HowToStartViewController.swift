//
//  HowToStart.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/12/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class HowToStartViewController: UIViewController {
    
    @IBOutlet var textBlock1: UILabel!
    @IBOutlet var startInvestingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startInvestingButton.layer.cornerRadius = startInvestingButton.frame.size.height / 2
        
        let sometext =  Texts()
        textBlock1.text = sometext.howToStart
}
    
    @IBAction func startInvestingButton(_ sender: Any) {

        if let url = NSURL(string: "https://www.tinkoff.ru/sl/4hDmqE4zkX3"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
