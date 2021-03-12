//
//  GameViewController.swift
//  Chess
//
//  Created by Default User on 3/11/21.
//  Copyright © 2021 Nikolay Padhaisky. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var boardCollectionView: UICollectionView!
    private var viewModel = GameViweModel()
    private let disposeBag = DisposeBag()
    private var boardViewDelegate = BoardCollectionViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        boardCollectionView.register(UINib(nibName: BoardViewCell.cellID, bundle: nil),
                                     forCellWithReuseIdentifier: BoardViewCell.cellID)
        layoutBoardCollectionView()
//        boardCollectionView.rx.setDelegate(boardViewDelegate)

        viewModel.cells
            .bind(to: boardCollectionView.rx.items(cellIdentifier: "BoardViewCell")) {
                (index, cellModel: BoardCell, cell: BoardViewCell) in
                cell.setupCell(with: cellModel)
            }
            .disposed(by: disposeBag)
        viewModel.initCells()
    }


    private func layoutBoardCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let size = boardCollectionView.bounds.width / CGFloat(8)
        flowLayout.itemSize = CGSize(width: size, height: size)
        boardCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }

}
