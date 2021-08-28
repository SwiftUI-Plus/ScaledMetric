import SwiftUI

/// A dynamic property that scales a numeric value.
@propertyWrapper
public struct ScaledMetric<Value>: DynamicProperty where Value: BinaryFloatingPoint {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.sizeCategory) var sizeCategory

    private let baseValue: Value
    private let metrics: UIFontMetrics

    public var wrappedValue: Value {
        let traits = UITraitCollection(traitsFrom: [
            UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass(sizeClass: horizontalSizeClass)),
            UITraitCollection(verticalSizeClass: UIUserInterfaceSizeClass(sizeClass: verticalSizeClass)),
            UITraitCollection(preferredContentSizeCategory: UIContentSizeCategory(sizeCategory: sizeCategory))
        ])

        return Value(metrics.scaledValue(for: CGFloat(baseValue), compatibleWith: traits))
    }

    /// Creates the scaled metric with an unscaled value using the default scaling.
    public init(baseValue: Value, metrics: UIFontMetrics) {
        self.baseValue = baseValue
        self.metrics = metrics
    }

    /// Creates the scaled metric with an unscaled value using the default scaling.
    public init(wrappedValue: Value) {
        self.init(baseValue: wrappedValue, metrics: UIFontMetrics(forTextStyle: .body))
    }

    /// Creates the scaled metric with an unscaled value and a text style to scale relative to.
    public init(wrappedValue: Value, relativeTo textStyle: UIFont.TextStyle) {
        self.init(baseValue: wrappedValue, metrics: UIFontMetrics(forTextStyle: textStyle))
    }

}

private extension UIUserInterfaceSizeClass {

    init(sizeClass: UserInterfaceSizeClass?) {
        switch sizeClass {
        case .compact: self = .compact
        case .regular: self = .regular
        default: self = .unspecified
        }
    }
}

private extension UIContentSizeCategory {
    init(sizeCategory: ContentSizeCategory?) {
        switch sizeCategory {
        case .accessibilityExtraExtraExtraLarge: self = .accessibilityExtraExtraExtraLarge
        case .accessibilityExtraExtraLarge: self = .accessibilityExtraExtraLarge
        case .accessibilityExtraLarge: self = .accessibilityExtraLarge
        case .accessibilityLarge: self = .accessibilityLarge
        case .accessibilityMedium: self = .accessibilityMedium
        case .extraExtraExtraLarge: self = .extraExtraExtraLarge
        case .extraExtraLarge: self = .extraExtraLarge
        case .extraLarge: self = .extraLarge
        case .extraSmall: self = .extraSmall
        case .large: self = .large
        case .medium: self = .medium
        case .small: self = .small
        default: self = .unspecified
        }
    }
}
