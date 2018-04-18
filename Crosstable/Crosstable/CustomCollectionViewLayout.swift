//
//  CustomCollectionViewLayout.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {

    // Visible cell's size and settings
    var cellSize = CGSize.zero
    var fixFirstRowColumn = false

    // Array of calculated cell's attributes
    private var itemAttributes = [[UICollectionViewLayoutAttributes]]()

    // Collection View's size
    private var contentSize: CGSize = .zero

    // MARK: OVERRIDED COLLECTION VIEW LAYOUT

    override func prepare() {
        generateItemAttributesIfNeeded()
        fixFirstRowColumnIfNeeded()
    }

    override var collectionViewContentSize: CGSize {
        return contentSize
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributes[indexPath.section][indexPath.row]
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return itemAttributes.flatMap { $0.filter { rect.intersects($0.frame) }  }
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}

extension CustomCollectionViewLayout {

    // MARK: MAIN LOGIC

    // Generate attributes for all cells
    private func generateItemAttributesIfNeeded() {

        guard let collectionView = collectionView else { return }
        guard itemAttributes.count != collectionView.numberOfSections else { return }

        itemAttributes = []

        for section in 0..<collectionView.numberOfSections {
            var sectionAttributes: [UICollectionViewLayoutAttributes] = []
            for index in 0..<collectionView.numberOfItems(inSection: section) {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: index, section: section))
                let point = CGPoint(x: cellSize.width * CGFloat(section), y: cellSize.height * CGFloat(index))
                attributes.frame = CGRect(origin: point, size: cellSize)
                attributes.zIndex += (section == 0 ? 1 : 0) + (index == 0 ? 1 : 0)
                sectionAttributes.append(attributes)
            }
            itemAttributes.append(sectionAttributes)
        }

        if let attributes = itemAttributes.last?.last {
            contentSize = CGSize(width: CGFloat(collectionView.numberOfSections) * cellSize.width, height: attributes.frame.maxY)
        }
    }

    // Fix first row and column
    private func fixFirstRowColumnIfNeeded() {

        guard fixFirstRowColumn else { return }
        guard let collectionView = collectionView else { return }

        // First row
        (0..<collectionView.numberOfSections).map { itemAttributes[$0][0] }.forEach {
            $0.frame.origin.y = collectionView.contentOffset.y
        }

        // First column
        itemAttributes[0].forEach {
            $0.frame.origin.x = collectionView.contentOffset.x
        }
    }

}
