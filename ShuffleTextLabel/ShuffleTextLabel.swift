//
//  ShuffleTextLabel.swift
//  ShuffleTextLabel
//
//  Created by Takeru Chuganji on 2/7/16.
//  Copyright © 2016 Takeru Chuganji. All rights reserved.
//

public class ShuffleTextLabel: UILabel {
    public var shuffleInterval = CFTimeInterval(0.05)
    public var shuffleCharactors: String?
    public var shuffleTextLength: Int? = 3
    public var shuffleSkipCharactorSet: NSCharacterSet? = NSCharacterSet.newlines as NSCharacterSet
    
    private weak var shuffleDisplayLink: CADisplayLink?
    private var shuffleBeginTime: CFTimeInterval?
    private var shuffleText: String?
    
    public func beginShuffleText(text: String) {
        self.invalidateShuffleText()
        let link = CADisplayLink(target: self, selector: #selector(animateOneFrame))
        link.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        self.shuffleBeginTime = CACurrentMediaTime()
        self.shuffleText = text
        self.shuffleDisplayLink = link
    }
    
    public func invalidateShuffleText() {
        self.shuffleDisplayLink?.invalidate()
    }
    
    // MARK: Private
    @objc private func animateOneFrame(link: CADisplayLink) {
        guard let beginTime = self.shuffleBeginTime, let text = self.shuffleText else {
            assertionFailure()
            return
        }
        let time = link.timestamp - beginTime
        let finishedIndex = Int(floor(time / self.shuffleInterval))
        if text.count <= finishedIndex {
            self.invalidateShuffleText()
        }
        
        self.text = text.enumerated().reduce("") { (current, pair) -> String in
            let index = pair.0
            let char = pair.1
            let shouldSkip = String(char).utf16.first.flatMap { self.shuffleSkipCharactorSet?.characterIsMember($0) } ?? false
            if index < finishedIndex || shouldSkip {
                return current + String(char)
            }
            if let shuffleTextLength = self.shuffleTextLength, shuffleTextLength + finishedIndex < index {
                return current
            }
            let chars = self.shuffleCharactors ?? text
            let shuffleIndex = Int(arc4random_uniform(UInt32(chars.count)))
            return current + String(chars[chars.index(chars.startIndex, offsetBy: shuffleIndex)])
        }
    }
}
