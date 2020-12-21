//
//  Extension+Color.swift
//  DynamicTable
//
//  Created by Ankita  on 21/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import Foundation
import UIKit

// Added  color extension to set color from color asset based on dark and light theme
enum AssetsColor {
    case labelTextColor
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .labelTextColor:
            return UIColor(named: "textColor")
        }
    }
}
