//
//  King.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/8/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct King: Figure {
    var id: Int
    var currentCoordinates: PlaceCoordinates
    var isWhite: Bool
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates : BoardCell]) -> [PlaceCoordinates] {
        return []
    }
    
    mutating func moveTo(_ place: PlaceCoordinates) {
        currentCoordinates = place
        print(currentCoordinates)
    }
}
