//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by apple on 4/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneOnlyOneCard:Int? {
        get {
            let faceUpCardIndicies = cards.indices.filter{cards[$0].isFaceUp}
            return faceUpCardIndicies.count == 1 ? faceUpCardIndicies.first : nil
        }
        set(newValue){
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneOnlyOneCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            }else{
                indexOfOneOnlyOneCard = index
            }
        }
    }
    
    init(numberOfPairofCards:Int){
        for _ in 0..<numberOfPairofCards {
            let card = Card()
            cards += [card, card]
        }
        // shuffle cards
        for _ in 0..<numberOfPairofCards {
            let randomIndex = Int(arc4random_uniform(UInt32(numberOfPairofCards*2)))
            cards.append(cards.remove(at:randomIndex))
        }
    }
}
