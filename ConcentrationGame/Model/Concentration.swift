//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by apple on 4/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        }else{
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    init(numberOfPairCards: Int) {
        for _ in 1...numberOfPairCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
}
