//
//  Knight.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/8/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct Knight: Figure {
    private let rowDiff = [1, 2]
    var id: Int
    var currentCoordinates: PlaceCoordinates
    var isWhite: Bool
    private var possiblePlaces: [PlaceCoordinates] {
        var places: [PlaceCoordinates] = []
        for width in 1...8 {
            for height in 1...8 {
                let widthDiff = abs(currentCoordinates.width - width)
                let heightDiff = abs(currentCoordinates.height - height)
                if widthDiff + heightDiff == 3 &&
                    rowDiff.contains(widthDiff)  &&
                    rowDiff.contains(heightDiff) {
                    places.append(PlaceCoordinates(height: height, width: width))
                }
            }
        }
        return places.filter { $0.isOnBoard }
    }
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates : BoardCell]) -> [PlaceCoordinates] {
        let places = possiblePlaces.filter {
            cells[$0]?.isFree ?? false
                || cells[$0]?.isContainOpponentFigure(for: self) ?? false
        }
        return places
    }
    
    mutating func moveTo(_ place: PlaceCoordinates) {
        currentCoordinates = place
        print(currentCoordinates)
    }
}
