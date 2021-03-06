//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by apple on 4/13/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairofCards: numberOfPairCards )
    
    var numberOfPairCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet weak private var flipLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private(set) var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
            }
        }
    }
    
    var theme: [String]? {
        didSet {
            emojiChoices = theme ?? [""]
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = ["🦅","🧙🏿‍♂️","🦇","🧛🏿‍♀️","🖤","🦹🏿‍♂️","🧟‍♂️"]
    
    private var emoji = Dictionary<Card,String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random:Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}

