//
//  CrosstableSettings.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

struct CrosstableSettings {
    var numberOfRows: Int
    var numberOfColumns: Int
    var widthOfCell: Int
    var heightOfCell: Int
    var coloring: Bool
    var fixFirstRowColumn: Bool
}

extension CrosstableSettings {

    static var `default`: CrosstableSettings  {
        return CrosstableSettings(numberOfRows: 75, numberOfColumns: 45, widthOfCell: 120, heightOfCell: 60, coloring: true, fixFirstRowColumn: true)
    }

}
