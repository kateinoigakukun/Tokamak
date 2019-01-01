//
//  Button.swift
//  GluonUIKit
//
//  Created by Max Desiatov on 29/12/2018.
//

import Gluon
import UIKit

extension UIButton: Default {
  public static var defaultValue: UIButton {
    return UIButton(type: .system)
  }
}

extension Button: UIControlComponent {
  public typealias Target = UIButton

  public static func update(wrapper: ControlBox<UIButton>,
                            _ props: Button.Props,
                            _ children: String) {
    let control = wrapper.control

    if let titleColor = props.titleColor {
      control.setTitleColor(UIColor(titleColor), for: .normal)
    }

    control.setTitle(children, for: .normal)
  }
}
