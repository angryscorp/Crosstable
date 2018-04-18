//
//  UIColor+Additions.swift
//  Crosstable
//
//  Created by Antony Karpov on 17.04.2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

extension UIColor {

    static var random: UIColor {
        return UIColor(
            red: CGFloat(drand48()),
            green: CGFloat(drand48()),
            blue: CGFloat(drand48()),
            alpha: 1
        )
    }

}
