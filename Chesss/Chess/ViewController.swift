//
//  ViewController.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var board = ChessBoard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        board.makeStartingLineup()
        if var currentFigure = board.showFigure(inPlace: PlaceCoordinates(height: 2, width: 1)) {
            let availablePlaces = currentFigure.showAvailablePlaces(onBoard: board.cells)
            board.move(figure: &currentFigure, to: availablePlaces.last ?? currentFigure.currentCoordinates)
            print(currentFigure.currentCoordinates)
        }
        if var currentFigure = board.showFigure(inPlace: PlaceCoordinates(height: 1, width: 1)) {
            let availablePlaces = currentFigure.showAvailablePlaces(onBoard: board.cells)
            board.move(figure: &currentFigure, to: availablePlaces.last ?? currentFigure.currentCoordinates)
            print(currentFigure.currentCoordinates)
        }
    }
    
    private func isLeadToMateMove(figure: Figure,
                                  from start: PlaceCoordinates,
                                  to finish: PlaceCoordinates) -> Bool {
        var possibleBoard = board
        var movingFigure = figure
        possibleBoard.move(figure: &movingFigure, to: finish)
        if figure.isWhite {
            for index in 0..<possibleBoard.blackFigures.count {
                if possibleBoard.blackFigures[index].showAvailablePlaces(onBoard: possibleBoard.cells).contains(possibleBoard.whiteKingCoordinates) {
                    return true
                }
            }
        } else {
            for index in 0..<possibleBoard.whiteFigures.count {
                if possibleBoard.whiteFigures[index].showAvailablePlaces(onBoard: possibleBoard.cells).contains(possibleBoard.blackKingCoordinates) {
                    return true
                }
            }
        }
        return false
    }
    
    
}

