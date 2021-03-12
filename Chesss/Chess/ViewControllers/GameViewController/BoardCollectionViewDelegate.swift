//
//  BoardCollectionViewDelegate.swift
//  Chess
//
//  Created by Default User on 3/12/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import UIKit

final class BoardCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let minimumItemSpacing: CGFloat = 0
    private let itemsPerRow: CGFloat = 8
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let nextVC = DetailPlayerInfoViewController()
//        nextVC.playerId = self.model[indexPath.row].employeeId
//        self.currentViewController?.pushWithEmptyTitle(controller: nextVC)
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = collectionView.bounds.width / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.minimumItemSpacing
    }
}
