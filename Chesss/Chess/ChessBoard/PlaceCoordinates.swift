//
//  PlaceCoordinates.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

struct PlaceCoordinates: Hashable {
    var height: Int
    var width: Int
    var isOnBoard: Bool {
        height > 0 && height < 9 && width > 0 && width < 9
    }
    
    func figureIDforStartPlace() -> Int {
        let factor = 8
        var id = factor * (self.height - 1)
        id += self.width
        return id
    }
}
