//
//  BoardViewCell.swift
//  Chess
//
//  Created by Default User on 3/11/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import UIKit

final class BoardViewCell: UICollectionViewCell {
    
    static let cellID = "BoardViewCell"
    
    @IBOutlet weak var cellBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupCell(with model: BoardCell) {
        if model.isWhite {
            cellBackgroundView.backgroundColor = .white
        } else {
            cellBackgroundView.backgroundColor = .darkGray
        }
    }

}
