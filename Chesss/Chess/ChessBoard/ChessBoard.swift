//
//  ChessBoard.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct ChessBoard {
    var cells: [PlaceCoordinates: BoardCell]
    
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
            let blackPawnCoordinates = PlaceCoordinates(height: 7, width: width)
            let blackPawn = Pawn(currentCoordinates: blackPawnCoordinates,
                                 id: blackPawnCoordinates.figureIDforStartPlace(),
                                 isWhite: false)
            cells[blackPawnCoordinates]?.state = .isFill(with: blackPawn)
            
            //set Rooks
            if width == 1 || width == 8 {
                let whiteRookCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteRook = Rook(id: whiteRookCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteRookCoordinates,
                                     isWhite: true)
                cells[whiteRookCoordinates]?.state = .isFill(with: whiteRook)
                let blackRookCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackRook = Rook(id: blackRookCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackRookCoordinates,
                                     isWhite: false)
                cells[blackRookCoordinates]?.state = .isFill(with: blackRook)
            }
            
            //set Knights
            if width == 2 || width == 7 {
                let whiteKnightCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteKnight = Knight(id: whiteKnightCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteKnightCoordinates,
                                     isWhite: true)
                cells[whiteKnightCoordinates]?.state = .isFill(with: whiteKnight)
                let blackKnightCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackKnight = Knight(id: blackKnightCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackKnightCoordinates,
                                     isWhite: false)
                cells[blackKnightCoordinates]?.state = .isFill(with: blackKnight)
            }
            
            //set Bishops
            if width == 3 || width == 6 {
                let whiteBishopCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteBishop = Bishop(id: whiteBishopCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteBishopCoordinates,
                                     isWhite: true)
                cells[whiteBishopCoordinates]?.state = .isFill(with: whiteBishop)
                let blackBishopCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackBishop = Bishop(id: blackBishopCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackBishopCoordinates,
                                     isWhite: false)
                cells[blackBishopCoordinates]?.state = .isFill(with: blackBishop)
            }
            
            //set Queens
            if width == 5 {
                let whiteQueenCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteQueen = Queen(id: whiteQueenCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteQueenCoordinates,
                                     isWhite: true)
                cells[whiteQueenCoordinates]?.state = .isFill(with: whiteQueen)
                let blackQueenCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackQueen = Queen(id: blackQueenCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackQueenCoordinates,
                                     isWhite: false)
                cells[blackQueenCoordinates]?.state = .isFill(with: blackQueen)
            }
            
            //set Kings
            if width == 4 {
                let whiteKingCoordinates = PlaceCoordinates(height: 1, width: width)
                let whiteKing = King(id: whiteKingCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: whiteKingCoordinates,
                                     isWhite: true)
                cells[whiteKingCoordinates]?.state = .isFill(with: whiteKing)
                let blackKingCoordinates = PlaceCoordinates(height: 8, width: width)
                let blackKing = Rook(id: whiteKingCoordinates.figureIDforStartPlace(),
                                     currentCoordinates: blackKingCoordinates,
                                     isWhite: false)
                cells[blackKingCoordinates]?.state = .isFill(with: blackKing)
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
