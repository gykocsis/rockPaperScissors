//
//  Card.swift
//  RockPaperScissorsFuckYeah
//
//  Created by Kocsis György on 2018. 10. 07..
//  Copyright © 2018. Gweilo. All rights reserved.
//

import Foundation
struct Card
{
    public var isChosen : Bool
    public var identifier : Int
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    public init(){
        self.isChosen = false
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
