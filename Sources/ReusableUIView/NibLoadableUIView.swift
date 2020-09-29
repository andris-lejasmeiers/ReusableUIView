//
//  NibLoadableUIView.swift
//  ReusableUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

public protocol NibLoadableUIView: AnyObject {
  static var nibName: String { get }
}

extension NibLoadableUIView where Self: UIView {
  static var nibName: String { String(describing: self) }
}
