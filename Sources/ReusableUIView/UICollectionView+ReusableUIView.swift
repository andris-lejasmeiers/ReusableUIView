//
//  UICollectionView+ReusableUIView.swift
//  ReusableUIView
//
//  Created by Andris Lejasmeiers on 05/12/2019.
//

import UIKit

extension UICollectionView {
  public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableUIView {
    register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }

  public func register<T: UICollectionReusableView>(
    _: T.Type,
    forSupplementaryViewOfKind kind: String
  ) where T: ReusableUIView {
    register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
  }

  public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableUIView,
    T: NibLoadableUIView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }

  public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T
    where T: ReusableUIView {
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: T.reuseIdentifier,
      for: indexPath
    ) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }

  public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T
    where T: ReusableUIView, T: NibLoadableUIView {
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: T.reuseIdentifier,
      for: indexPath
    ) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }

  public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
    ofKind kind: String,
    for indexPath: IndexPath
  ) -> T where T: ReusableUIView {
    let identifier = T.reuseIdentifier
    guard let cell = dequeueReusableSupplementaryView(
      ofKind: kind,
      withReuseIdentifier: identifier,
      for: indexPath
    ) as? T else {
      fatalError("Could not dequeue reusable supplementaryView with identifier: \(identifier)")
    }
    return cell
  }
}
