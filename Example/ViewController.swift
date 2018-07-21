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
            $0!.shuffleCharactors = "abcdefghijklmnopqrstuvwxyz".uppercased()
        }
        self.label1.shuffleInterval = 0.014
        self.label2.shuffleTextLength = 2
        self.label2.shuffleInterval = 0.008
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.beginShuffleAnimation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.beginShuffleAnimation()
    }
    
    private func beginShuffleAnimation() {
        self.label1.beginShuffleText(text: "SHUFFLETEXTLABEL")
        self.label2.beginShuffleText(text: "CREATED BY HOPPENICHU / INSPIRED BY THA LTD")
    }
}

