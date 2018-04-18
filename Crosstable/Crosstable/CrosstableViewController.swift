//
//  CrosstableViewController.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

class CrosstableViewController: UIViewController {

    // Settings for Collection View
    private var settings: CrosstableSettings!

    func setNewSettings(_ newSettings: CrosstableSettings) {
        self.settings = newSettings
    }

    // MARK: IB OUTLETS

    @IBOutlet private weak var collection: UICollectionView! {
        didSet {
            if let viewLayout = collection.collectionViewLayout as? CustomCollectionViewLayout {
                viewLayout.fixFirstRowColumn = settings.fixFirstRowColumn
                viewLayout.cellSize = CGSize(width: settings.widthOfCell, height: settings.heightOfCell)
            }
        }
    }

    // MARK: USER'S ACTIONS

    @objc private func tapSubview(sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? CustomCollectionViewCell, let index = cell.indexPath else { return }
        let alertController = UIAlertController(title: "ID: \(index)", message: cell.currentTitle, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}

extension CrosstableViewController: UICollectionViewDataSource {

    // MARK: COLLECTION VIEW'S DATA SOURCE

    private var reuseIdentifier: String { return "customCell" }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let cell = cell as? CustomCollectionViewCell {
            cell.configCell(for: indexPath)
            cell.backgroundColor = settings.coloring ? .random : .white
            cell.gestureRecognizers?.removeAll()
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapSubview)))
        }
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return settings.numberOfColumns
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.numberOfRows
    }

}
