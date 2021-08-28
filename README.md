![ios](https://img.shields.io/badge/iOS-13-green)

# ScaledMetric

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

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (__preferred__)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/ShapsUI/ScaledMetric.git", .upToNextMinor(from: "1.0.0"))`

> Note: The package requires iOS v13+
