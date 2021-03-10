//
//  King.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/8/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct King: Figure {
    private let rowDiff = [-1, 1]
    var id: Int
    var currentCoordinates: PlaceCoordinates
    var isWhite: Bool
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates : BoardCell]) -> [PlaceCoordinates] {
        var possiblePlaces: [PlaceCoordinates] = []
        var nextCell = currentCoordinates
        rowDiff.forEach{ height in
            rowDiff.forEach{ width in
                nextCell.height += height
                nextCell.width += width
                if nextCell.isOnBoard &&
                    (cells[nextCell]?.isFree ?? true) ||
                    cells[nextCell]?.isContainOpponentFigure(for: self) ?? false {
                    possiblePlaces.append(nextCell)
                }
            }
            nextCell.height += height
            if nextCell.isOnBoard &&
                (cells[nextCell]?.isFree ?? true) ||
                cells[nextCell]?.isContainOpponentFigure(for: self) ?? false {
                possiblePlaces.append(nextCell)
            }
            nextCell = currentCoordinates
            nextCell.width += height
            if nextCell.isOnBoard &&
                (cells[nextCell]?.isFree ?? true) ||
                cells[nextCell]?.isContainOpponentFigure(for: self) ?? false {
                possiblePlaces.append(nextCell)
            }
        }
        return possiblePlaces
    }
    
    mutating func moveTo(_ place: PlaceCoordinates) {
        currentCoordinates = place
        print(currentCoordinates)
    }
}
