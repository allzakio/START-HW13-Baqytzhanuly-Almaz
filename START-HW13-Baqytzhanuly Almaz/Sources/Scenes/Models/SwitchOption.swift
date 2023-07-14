//
//  SwitchOption.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 7/11/23.
//

import Foundation
import UIKit

struct SwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}
