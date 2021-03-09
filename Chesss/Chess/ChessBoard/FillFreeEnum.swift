//
//  FillFreeEnum.swift
//  Chess
//
//  Created by Anton Krivonosov on 3/7/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import Foundation

enum FillState {
    case isFree
    case isFill(with: Figure)
    
    func figureInPlace() -> Figure? {
        switch self {
        case .isFree:
            return nil
        case .isFill(with: let with):
            return with
        }
    }
}
