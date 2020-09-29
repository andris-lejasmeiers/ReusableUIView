// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "ReusableUIView",
  products: [
    .library(name: "ReusableUIView", targets: ["ReusableUIView"]),
  ],
  targets: [
    .target(name: "ReusableUIView"),
  ]
)
