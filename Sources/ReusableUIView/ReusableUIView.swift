//
//  ReusableUIView.swift
//  ReusableUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

public protocol ReusableUIView: AnyObject {
  static var reuseIdentifier: String { get }
}

extension ReusableUIView where Self: UIView {
  public static var reuseIdentifier: String { String(describing: self) }
}
