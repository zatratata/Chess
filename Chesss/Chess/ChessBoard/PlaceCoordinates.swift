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
    
    func figureIDforStartPlace() -> Int {
        let factor = 8
        var id = factor * (self.height - 1)
        id += self.width
        return id
    }
}
