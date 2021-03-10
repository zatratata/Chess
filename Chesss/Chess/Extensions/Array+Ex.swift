//
//  Array+Ex.swift
//  Chess
//
//  Created by Default User on 3/10/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

extension Array where Element: Figure {
    mutating func remove(figure: Figure) {
        self.enumerated().forEach { (index, item) in
            if item.id == figure.id {
                self.remove(at: index)
            }
        }
    }
}
