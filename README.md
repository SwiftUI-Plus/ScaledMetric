![ios](https://img.shields.io/badge/iOS-13-green)

# ScaledMetric

> Also available as a part of my [SwiftUI+ Collection](https://benkau.com/packages.json) – just add it to Xcode 13+

A dynamic property wrapper that scales a numeric value. Identical to the new iOS 14 implementation, but back-ported to suport iOS 13 as well.

## Example

```swift
@ScaledMetric(wrappedValue: 4)
private var spacing: CGFloat

...
// the spacing will automatically scale with the current `ContentSizeCategory` value
VStack(spacing: spacing) { ... }
```

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (**preferred**)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/SwiftUI-Plus/ScaledMetric.git", .upToNextMinor(from: "1.0.0"))`

> Note: The package requires iOS v13+

## Other Packages

If you want easy access to this and more packages, add the following collection to your Xcode 13+ configuration:

`https://benkau.com/packages.json`
