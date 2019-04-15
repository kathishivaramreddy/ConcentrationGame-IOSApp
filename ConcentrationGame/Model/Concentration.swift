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
    
    func chooseCard (at index: Int) {
        
    }
    
    init(numberOfPairCards: Int) {
        for _ in 1...numberOfPairCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
}
