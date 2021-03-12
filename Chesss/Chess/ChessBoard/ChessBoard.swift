//
//  ChessBoard.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation
import RxSwift

struct ChessBoard {
    var model = PublishSubject<[PlaceCoordinates: BoardCell]>()
    var cells: [PlaceCoordinates: BoardCell]
    var whiteFigures: [Figure] = []
    var blackFigures: [Figure] = []
    private(set) var whiteKingCoordinates = PlaceCoordinates(height: 0, width: 0)
    private(set) var blackKingCoordinates = PlaceCoordinates(height: 0, width: 0)
    
    init() {
        cells = [:]
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
                cells[coordinates] = cell
            }
        }
    }
    
    mutating func makeStartingLineup() {
        for width in 1...8 {
            let whitePawnCoordinates = PlaceCoordinates(height: 2, width: width)
            let whitePawn = Pawn(currentCoordinates: whitePawnCoordinates,
                                 id: whitePawnCoordinates.figureIDforStartPlace(),
                                 isWhite: true)
            cells[whitePawnCoordinates]?.state = .isFill(with: whitePawn)
            whiteFigures.append(whitePawn)
            let blackPawnCoordinates = PlaceCoordinates(height: 7, width: width)
            let blackPawn = Pawn(currentCoordinates: blackPawnCoordinates,
                                 id: blackPawnCoordinates.figureIDforStartPlace(),
                                 isWhite: false)
            cells[blackPawnCoordinates]?.state = .isFill(with: blackPawn)
            blackFigures.append(blackPawn)
            
            //set Rooks
            if width == 1 || width == 8 {
                let whiteRookCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteRook = Rook(id: whiteRookCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteRookCoordinates,
                                     isWhite: true)
                cells[whiteRookCoordinates]?.state = .isFill(with: whiteRook)
                whiteFigures.append(whiteRook)
                let blackRookCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackRook = Rook(id: blackRookCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackRookCoordinates,
                                     isWhite: false)
                cells[blackRookCoordinates]?.state = .isFill(with: blackRook)
                blackFigures.append(blackRook)
            }
            
            //set Knights
            if width == 2 || width == 7 {
                let whiteKnightCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteKnight = Knight(id: whiteKnightCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteKnightCoordinates,
                                     isWhite: true)
                cells[whiteKnightCoordinates]?.state = .isFill(with: whiteKnight)
                whiteFigures.append(whiteKnight)
                let blackKnightCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackKnight = Knight(id: blackKnightCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackKnightCoordinates,
                                     isWhite: false)
                cells[blackKnightCoordinates]?.state = .isFill(with: blackKnight)
                blackFigures.append(blackKnight)
            }
            
            //set Bishops
            if width == 3 || width == 6 {
                let whiteBishopCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteBishop = Bishop(id: whiteBishopCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteBishopCoordinates,
                                     isWhite: true)
                cells[whiteBishopCoordinates]?.state = .isFill(with: whiteBishop)
                whiteFigures.append(whiteBishop)
                let blackBishopCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackBishop = Bishop(id: blackBishopCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackBishopCoordinates,
                                     isWhite: false)
                cells[blackBishopCoordinates]?.state = .isFill(with: blackBishop)
                blackFigures.append(blackBishop)
            }
            
            //set Queens
            if width == 5 {
                let whiteQueenCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteQueen = Queen(id: whiteQueenCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteQueenCoordinates,
                                     isWhite: true)
                cells[whiteQueenCoordinates]?.state = .isFill(with: whiteQueen)
                whiteFigures.append(whiteQueen)
                let blackQueenCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackQueen = Queen(id: blackQueenCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackQueenCoordinates,
                                     isWhite: false)
                cells[blackQueenCoordinates]?.state = .isFill(with: blackQueen)
                blackFigures.append(blackQueen)
            }
            
            //set Kings
            if width == 4 {
                let whiteKingCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteKing = King(id: whiteKingCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteKingCoordinates,
                                     isWhite: true)
                self.whiteKingCoordinates = whiteKingCoordinates
                cells[whiteKingCoordinates]?.state = .isFill(with: whiteKing)
                whiteFigures.append(whiteKing)
                let blackKingCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackKing = King(id: blackKingCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackKingCoordinates,
                                     isWhite: false)
                self.blackKingCoordinates = blackKingCoordinates
                cells[blackKingCoordinates]?.state = .isFill(with: blackKing)
                blackFigures.append(blackKing)
            }
        }
    }
    
    mutating func move( figure: inout Figure, to place: PlaceCoordinates) {
        let availablePlaces = figure.showAvailablePlaces(onBoard: cells)
        guard availablePlaces.contains(place) else { return }
        cells[figure.currentCoordinates]?.state = .isFree
        cells[place]?.state = .isFill(with: figure)
        figure.currentCoordinates = place
    }
    
    func showFigure(inPlace place: PlaceCoordinates) -> Figure? {
        guard let figure = cells[place]?.state.figureInPlace() else { return  nil }
        print(figure)
        return figure
    }
}
