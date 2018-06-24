//
//  StringUtils.swift
//

import Foundation
import UIKit


extension UIView {
//    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
//        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
//            self.alpha = 1.0
//            }, completion: completion)  }
//
//    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
//        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
//            self.alpha = 0.0
//            }, completion: completion)
//    }

    // Name this function in a way that makes sense to you...
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(_ duration: TimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()

        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromLeftTransition.delegate = delegate
        }

        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved

        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
}

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var leftBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = UIColor(cgColor: layer.borderColor!)
            self.addSubview(line)

            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line]|", options: [], metrics: nil, views: views))
        }
    }

    @IBInspectable var topBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)

            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
        }
    }

    @IBInspectable var rightBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: bounds.width, y: 0.0, width: newValue, height: bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)

            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line]|", options: [], metrics: nil, views: views))
        }
    }
    @IBInspectable var bottomBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height, width: bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)

            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }

}

extension UILabel {

    /// The receiver’s font size, including any adjustment made to fit to width. (read-only)
    ///
    /// If `adjustsFontSizeToFitWidth` is not `true`, this is just an alias for
    /// `.font.pointSize`. If it is `true`, it returns the adjusted font size.
    ///
    /// Derived from: [http://stackoverflow.com/a/28285447/5191100](http://stackoverflow.com/a/28285447/5191100)
    var fontSize: CGFloat {
        get {
            if adjustsFontSizeToFitWidth {
                var currentFont: UIFont = font
                let originalFontSize = currentFont.pointSize
                var currentSize: CGSize = (text! as NSString).size(withAttributes: [NSAttributedStringKey.font: currentFont])

                while currentSize.width > frame.size.width && currentFont.pointSize > (originalFontSize * minimumScaleFactor) {
                    currentFont = currentFont.withSize(currentFont.pointSize - 1)
                    currentSize = (text! as NSString).size(withAttributes: [NSAttributedStringKey.font: currentFont])
                }

                return currentFont.pointSize
            }

            return font.pointSize
        }
    }
}

protocol NSStringKBAdditions {
    func fontSizeWithFont(_ font: UIFont, constrainedToSize size: CGSize, minimumScaleFactor: CGFloat) -> CGFloat
}

extension NSString : NSStringKBAdditions {
    func fontSizeWithFont(_ font: UIFont, constrainedToSize size: CGSize, minimumScaleFactor: CGFloat) -> CGFloat {
        var fontSize = font.pointSize
        let minimumFontSize = fontSize * minimumScaleFactor


        var attributedText = NSAttributedString(string: self as String, attributes:[NSAttributedStringKey.font: font])
        var height = attributedText.boundingRect(with: CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude), options:NSStringDrawingOptions.usesLineFragmentOrigin, context:nil).size.height

        var newFont = font
        //Reduce font size while too large, break if no height (empty string)
        while (height > size.height && height != 0 && fontSize > minimumFontSize) {
            fontSize -= 1;
            newFont = UIFont(name: font.fontName, size: fontSize)!

            attributedText = NSAttributedString(string: self as String, attributes:[NSAttributedStringKey.font: newFont])
            height = attributedText.boundingRect(with: CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude), options:NSStringDrawingOptions.usesLineFragmentOrigin, context:nil).size.height
        }

        // Loop through words in string and resize to fit
        for word in self.components(separatedBy: CharacterSet.whitespacesAndNewlines) {
            var width = word.size(withAttributes: [NSAttributedStringKey.font:newFont]).width
            while (width > size.width && width != 0 && fontSize > minimumFontSize) {
                fontSize -= 1
                newFont = UIFont(name: font.fontName, size: fontSize)!
                width = word.size(withAttributes: [NSAttributedStringKey.font:newFont]).width
            }
        }
        return fontSize;
    }
}


extension UIView {

    @objc func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
//        layer.shadowPath = UIBezierPath.init(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath

        let backgroundCGColor = self.backgroundColor?.cgColor
        self.backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}

extension UITextView {

    override func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        //        layer.shadowPath = UIBezierPath.init(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath

        let backgroundCGColor = self.backgroundColor?.cgColor
        self.backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}


protocol UILabelKBAdditions {
    func sizeToFitMultipleLines()
}

extension UILabel : UILabelKBAdditions {
    func sizeToFitMultipleLines() {
        if self.adjustsFontSizeToFitWidth {
            if let text = self.text {
                let adjustedFontSize = text.fontSizeWithFont(self.font, constrainedToSize:self.frame.size, minimumScaleFactor:self.minimumScaleFactor)
                self.font = self.font.withSize(adjustedFontSize)
                self.sizeToFit()
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
