//
//  rockPaperScissors.swift
//  RockPaperScissorsFuckYeah
//
//  Created by Kocsis György on 2018. 10. 07..
//  Copyright © 2018. Gweilo. All rights reserved.
//

import Foundation

class RockPaperScissors{
    
    private var cards = [Card]()
    
    private let victoryArray = [0, -1, 1]
    private var computerVictory : Int = 1
    
    public func returnComputerCard(playerCard: Int) -> (result: Int, indexOfResult: Int) {
        let tempVictoryArray = victoryArray.shiftRight(amount: -playerCard)
        print("The shifted cards are: \(tempVictoryArray)")
        let returnIndex = tempVictoryArray.firstIndex(of:computerVictory)!
        print(returnIndex)
        return (computerVictory, returnIndex)
    }
    
    init(numberOfCards: Int){
        print("Now choosing a random card for the computer")
        computerVictory = victoryArray[(numberOfCards).arc4random]
        print("The chosen value is: \(computerVictory)")
    }
}



extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return Int(arc4random_uniform(UInt32(abs(self))))
        }
    }
}

extension Array{
    func shiftRight(amount : Int = 1) -> [Element]{
        let lessShiftThanCount : Bool = (abs(amount) < count)
        var am = Int(lessShiftThanCount) * amount + Int(!lessShiftThanCount) * amount % count
        if am < 0 {am += count}
        return Array(self[am ..< count] + self[0 ..< am])
    }
    
}


extension Int{
    public init (_ bool: Bool){
        self = bool ? 1 : 0
    }
}
