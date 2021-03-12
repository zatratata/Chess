//
//  GameViweModel.swift
//  Chess
//
//  Created by Default User on 3/11/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import RxSwift
import Foundation

final class GameViweModel {
    var board = PublishSubject<ChessBoard>()
    var cells = PublishSubject<[BoardCell]>()
    
    func initCells() {
        var id = 1
        var cellsArray = [BoardCell]()
        for height in 1...8 {
            for width in 1...8 {
                let coordinates = PlaceCoordinates(height: height, width: width)
                var cell: BoardCell
                if height.isEven == width.isEven {
                   cell = BoardCell(coordinates: coordinates,
                             isWhite: true,
                             state: .isFree)
                } else {
                    cell = BoardCell(coordinates: coordinates,
                              isWhite: false,
                              state: .isFree)
                }
                cellsArray.append(cell)
            }
        }
        cells.onNext(cellsArray)
    }
}
