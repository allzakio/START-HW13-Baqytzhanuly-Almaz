//
//  BasicOption.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 7/11/23.
//

import Foundation
import UIKit

struct BasicOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let rightLabel: String?
    let rightLabelBackgroundColor: UIColor?
    let handler: (() -> Void)
}
