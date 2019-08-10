import Foundation
import UIKit

// MARK: NSLayoutConstraint Convenience methods
extension NSLayoutConstraint {

    // Pins an attribute of a view to an attribute of another view
    // swiftlint:disable function_parameter_count
    public static func pinning(view: UIView, attribute: NSLayoutConstraint.Attribute, toView: UIView?,
                               toAttribute: NSLayoutConstraint.Attribute,
                               multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal, toItem: toView,
                                  attribute: toAttribute, multiplier: multiplier, constant: constant)
    }

    // Pins an array of NSLayoutAttributes of a view to a specific view (has to respect view tree hierarchy)
    public static func pinning(view: UIView, toView: UIView?, attributes: [NSLayoutConstraint.Attribute],
                               multiplier: CGFloat, constant: CGFloat) -> [NSLayoutConstraint] {
        return attributes.compactMap({ (attribute) -> NSLayoutConstraint in
            return NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal,
                                      toItem: toView, attribute: attribute, multiplier: multiplier, constant: constant)
        })
    }

    // Pins bottom, top, leading and trailing of a view to a specific view (has to respect view tree hierarchy)
    public static func pinningEdges(view: UIView, toView: UIView?) -> [NSLayoutConstraint] {
        let attributes: [NSLayoutConstraint.Attribute] = [.top, .bottom, .leading, .trailing]
        return NSLayoutConstraint.pinning(view: view, toView: toView,
                                          attributes: attributes, multiplier: 1.0, constant: 0.0)
    }

    // Pins bottom, top, leading and trailing of a view to its superview
    public static func pinningEdgesToSuperview(view: UIView) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.pinningEdges(view: view, toView: view.superview)
    }

    // Pins specified attribute to superview with specified or default multiplier and constant
    public static func pinningToSuperview(view: UIView, attributes: [NSLayoutConstraint.Attribute],
                                          multiplier: CGFloat, constant: CGFloat) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.pinning(view: view, toView: view.superview, attributes: attributes,
                                          multiplier: multiplier, constant: constant)
    }
}
// MARK: UIView Convenience methods
extension UIView {
   public func pinEdgesToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else { return }
        let constraints = NSLayoutConstraint.pinningEdgesToSuperview(view: self)
        superview.addConstraints(constraints)
    }

    public func pinToSuperview(forAtrributes attributes: [NSLayoutConstraint.Attribute],
                               multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else { return }
        let constraints = NSLayoutConstraint.pinningToSuperview(view: self, attributes: attributes,
                                                                multiplier: multiplier, constant: constant)
        superview.addConstraints(constraints)
    }

    public func pin(toView: UIView, attributes: [NSLayoutConstraint.Attribute], multiplier: CGFloat = 1.0,
                    constant: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else { return }

        let contantSize = MLSizes.size(multiple: constant)
        let constraints = NSLayoutConstraint.pinning(view: self, toView: toView, attributes: attributes,
                                                     multiplier: multiplier, constant: contantSize)
        superview.addConstraints(constraints)
    }

    public func pin(attribute: NSLayoutConstraint.Attribute, toView: UIView?,
                    toAttribute: NSLayoutConstraint.Attribute,
                    multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {

        let contantSize = MLSizes.size(multiple: constant)
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else { return }
        let constraint = NSLayoutConstraint.pinning(view: self, attribute: attribute, toView: toView,
                                                    toAttribute: toAttribute, multiplier: multiplier,
                                                    constant: contantSize)
        superview.addConstraint(constraint)
    }

    public func widthAnchor(constant: CGFloat) {
        let constantSize = MLSizes.size(multiple: constant)
        widthAnchor.constraint(equalToConstant: constantSize).isActive = true
    }

    public func heightAnchor(constant: CGFloat) {
        let constantSize = MLSizes.size(multiple: constant)
        heightAnchor.constraint(equalToConstant: constantSize).isActive = true
    }

    public func sizeAnchor(width: CGFloat, height: CGFloat) {
        let constantW = MLSizes.size(multiple: width)
        let constantH = MLSizes.size(multiple: height)
        widthAnchor.constraint(equalToConstant: constantW).isActive = true
        heightAnchor.constraint(equalToConstant: constantH).isActive = true
    }
}
