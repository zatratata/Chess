//
//  FigureProtocol.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

protocol Figure {
    var id: Int { get }
    var isWhite: Bool { get }
    var currentCoordinates: PlaceCoordinates { get set }
    
    func showAvailablePlaces(onBoard cells: [PlaceCoordinates: BoardCell]) -> [PlaceCoordinates]
    mutating func moveTo(_ place: PlaceCoordinates)
}

extension Figure {
    func isOur(_ figure: Figure) -> Bool {
        return self.isWhite == figure.isWhite
    }
}
