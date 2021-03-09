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
        print(board.cells[PlaceCoordinates(height: 3, width: 1)])
        if var currentFigure = board.showFigure(inPlace: PlaceCoordinates(height: 2, width: 2)) {
            let availablePlaces = currentFigure.showAvailablePlaces(onBoard: board.cells)
            board.move(figure: &currentFigure, to: availablePlaces.last ?? currentFigure.currentCoordinates)
            print(currentFigure.currentCoordinates)
        }
        if var currentFigure = board.showFigure(inPlace: PlaceCoordinates(height: 1, width: 3)) {
            let availablePlaces = currentFigure.showAvailablePlaces(onBoard: board.cells)
            board.move(figure: &currentFigure, to: availablePlaces.last ?? currentFigure.currentCoordinates)
            print(currentFigure.currentCoordinates)
        }
    }
    
    
}

