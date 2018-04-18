//
//  CustomCollectionViewCell.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

@IBDesignable
class CustomCollectionViewCell: UICollectionViewCell {

    // ID of this cell
    private (set) var indexPath: IndexPath?
    var currentTitle: String { return mainLabel.text ?? "" }

    // MARK: IB OUTLETS

    @IBOutlet private weak var mainLabel: UILabel!

    // MARK: INITS

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    // MARK: CONFIG UI

    func configCell(for indexPath: IndexPath) {
        self.indexPath = indexPath
        let row = "Row: \(indexPath.row+1)"
        let column = "Column: \(indexPath.section+1)"
        mainLabel.text = "\(row)\n\(column)"
    }

}
