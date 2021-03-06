//
//  Rook.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/8/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct Rook: Figure {
    private let rowDiff = [-1, 1]
    var id: Int
    var currentCoordinates: PlaceCoordinates
    var isWhite: Bool
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates : BoardCell]) -> [PlaceCoordinates] {
        var possiblePlaces: [PlaceCoordinates] = []
        var nextCell = currentCoordinates
        rowDiff.forEach { height  in
            nextCell.height += height
            while true {
                if !nextCell.isOnBoard ||
                    !(cells[nextCell]?.isFree ?? true) {
                    if cells[nextCell]?.isContainOpponentFigure(for: self) ?? false  {
                        possiblePlaces.append(nextCell)
                    }
                    nextCell = PlaceCoordinates(height: currentCoordinates.height,
                                                width: currentCoordinates.width)
                    break
                }
                possiblePlaces.append(nextCell)
                nextCell.height += height
            }
        }
        
        rowDiff.forEach { width  in
            nextCell.width += width
            while true {
                if !nextCell.isOnBoard ||
                    !(cells[nextCell]?.isFree ?? true) {
                    if cells[nextCell]?.isContainOpponentFigure(for: self) ?? false  {
                        possiblePlaces.append(nextCell)
                    }
                    nextCell = PlaceCoordinates(height: currentCoordinates.height,
                                                width: currentCoordinates.width)
                    break
                }
                possiblePlaces.append(nextCell)
                nextCell.width += width
            }
        }
        return possiblePlaces
    }
    
    mutating func moveTo(_ place: PlaceCoordinates) {
        currentCoordinates = place
        print(currentCoordinates)
    }
}
