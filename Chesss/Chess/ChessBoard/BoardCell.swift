//
//  BoardCell.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct BoardCell {
    let coordinates: PlaceCoordinates
    let isWhite: Bool
    var state: FillState
    var isFree: Bool {
        state.figureInPlace() == nil ? true : false
    }
    
    func isContainOpponentFigure(for ourFigure: Figure) -> Bool {
        guard let figure = state.figureInPlace() else { return false }
        return figure.isWhite == ourFigure.isWhite ? false : true
    }
}
