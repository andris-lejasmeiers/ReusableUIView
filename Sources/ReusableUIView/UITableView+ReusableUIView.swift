//
//  UITableView+ReusableUIView.swift
//  ReusableUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

extension UITableView {
  public func register<T: UITableViewCell>(_: T.Type) where T: ReusableUIView {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }

  public func register<T: UITableViewCell>(_: T.Type) where T: ReusableUIView,
    T: NibLoadableUIView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }

  public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T
    where T: ReusableUIView, T: NibLoadableUIView {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
      else {
        fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }

  public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T
    where T: ReusableUIView {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
      else {
        fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }

  public func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type)
    where T: ReusableUIView, T: NibLoadableUIView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
  }

  public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T
    where T: ReusableUIView {
    let identifier = T.reuseIdentifier
    guard let cell = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
      fatalError("Could not dequeue Reusable HeaderFooterView with identifier: \(identifier)")
    }
    return cell
  }
}
