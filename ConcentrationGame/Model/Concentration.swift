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
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = nil
                    }else{
                      return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
            }
            cards[index].isFaceUp = true
        }else{
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
