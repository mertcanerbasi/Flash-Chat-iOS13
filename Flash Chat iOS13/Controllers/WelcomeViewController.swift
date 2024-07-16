//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelAnimation()



    }


    func titleLabelAnimation(){
        self.titleLabel.text = ""
        let appName = K.appName
        var currentIndex = appName.startIndex
        Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if(currentIndex == appName.endIndex) {
                timer.invalidate()
            }
            else {
                self.titleLabel.text?.append(appName[currentIndex])
                currentIndex = appName.index(after: currentIndex)
            }
        }
    }


}
