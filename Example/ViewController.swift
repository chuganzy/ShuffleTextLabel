//
//  ViewController.swift
//  Example
//
//  Created by Takeru Chuganji on 2/7/16.
//  Copyright © 2016 Takeru Chuganji. All rights reserved.
//

import UIKit
import ShuffleTextLabel

class ViewController: UIViewController {

    @IBOutlet private weak var label1: ShuffleTextLabel!
    @IBOutlet private weak var label2: ShuffleTextLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [self.label1, self.label2].forEach {
            $0.shuffleCharactors = "abcdefghijklmnopqrstuvwxyz".uppercaseString.characters
        }
        self.label1.shuffleInterval = 0.014
        self.label2.shuffleTextLength = 2
        self.label2.shuffleInterval = 0.008
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.beginShuffleAnimation()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.beginShuffleAnimation()
    }
    
    private func beginShuffleAnimation() {
        self.label1.beginShuffleText("SHUFFLETEXTLABEL")
        self.label2.beginShuffleText("CREATED BY HOPPENICHU / INSPIRED BY THA LTD")
    }
}

