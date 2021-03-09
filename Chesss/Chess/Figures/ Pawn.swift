//
//   Pawn.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct Pawn: Figure {
    private let startPlaceHeights = [2, 7]
    
    var currentCoordinates: PlaceCoordinates
    var id: Int
    var isWhite: Bool
    
    private var smallMove: PlaceCoordinates {
        if isWhite {
           return PlaceCoordinates(height: currentCoordinates.height + 1, width: currentCoordinates.width)
        } else {
           return PlaceCoordinates(height: currentCoordinates.height - 1, width: currentCoordinates.width)
        }
    }
    
    private var longMove: PlaceCoordinates {
        if isWhite {
           return PlaceCoordinates(height: currentCoordinates.height + 2, width: currentCoordinates.width)
        } else {
           return PlaceCoordinates(height: currentCoordinates.height - 2, width: currentCoordinates.width)
        }
    }
    
    private var attackPlaces: [PlaceCoordinates] {
        var places: [PlaceCoordinates] = []
        if currentCoordinates.width > 1 {
            places.append(PlaceCoordinates(height: currentCoordinates.height + 1,
                                           width: currentCoordinates.width - 1))
        }
        if currentCoordinates.width < 8 {
            places.append(PlaceCoordinates(height: currentCoordinates.height + 1,
                                           width: currentCoordinates.width + 1))
        }
        return places
    }
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates : BoardCell]) -> [PlaceCoordinates] {
        var availablePlaces: [PlaceCoordinates] = []
        if cells[smallMove]?.isFree ?? false {
            availablePlaces.append(smallMove)
            if startPlaceHeights.contains(currentCoordinates.height)
                && cells[longMove]?.isFree ?? false {
                availablePlaces.append(longMove)
            }
        }
        let placesForAttack = attackPlaces.filter {
            cells[$0]?.isContainOpponentFigure(for: self) ?? false
        }
        availablePlaces.append(contentsOf: placesForAttack)
        return availablePlaces
    }
    
    mutating func moveTo(_ place: PlaceCoordinates) {
        currentCoordinates = place
    }
    
    
}
