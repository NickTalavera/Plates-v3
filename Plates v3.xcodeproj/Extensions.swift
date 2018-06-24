//
//  StringUtils.swift
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(watchOS)
    import WatchKit
#elseif os(OSX)
    import Cocoa
#endif

extension Int {

    func toBool () ->Bool? {
        switch self {
        case 0:
            return false
        case 1:
            return true
        default:
            return nil
        }
    }
}

extension Bool {
    
    func toOpposite () ->Bool {
        switch self {
        case true:
            return false
        case false:
            return true
        }
    }
}
    
extension Color {

    func lighter(_ amount : CGFloat = 0.25) -> Color {
        return hueColorWithBrightnessAmount(1 + amount)
    }

    func darker(_ amount : CGFloat = 0.25) -> Color {
        return hueColorWithBrightnessAmount(1 - amount)
    }

    fileprivate func hueColorWithBrightnessAmount(_ amount: CGFloat) -> Color {
        var hue         : CGFloat = 0
        var saturation  : CGFloat = 0
        var brightness  : CGFloat = 0
        var alpha       : CGFloat = 0

        #if os(iOS)

            if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return Color( hue: hue,
                                saturation: saturation,
                                brightness: brightness * amount,
                                alpha: alpha )
            } else {
                return self
            }

        #else

            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return Color( hue: hue,
                            saturation: saturation,
                            brightness: brightness * amount,
                            alpha: alpha )
            
        #endif
        
    }
    
}


extension Dictionary {
    mutating func update(_ other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

extension String {
    // Returns true if the string has at least one character in common with matchCharacters.
    func containsCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }

    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }

    // Returns true if the string has no characters in common with matchCharacters.
    func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }

    // Returns true if the string represents a proper numeric value.
    // This method uses the device's current locale setting to determine
    // which decimal separator it will accept.
    func isNumeric() -> Bool
    {
        let scanner = Scanner(string: self)

        // A newly-created scanner has no locale by default.
        // We'll set our scanner's locale to the user's locale
        // so that it recognizes the decimal separator that
        // the user expects (for example, in North America,
        // "." is the decimal separator, while in many parts
        // of Europe, "," is used).
        scanner.locale = Locale.current

        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }

    func replace(_ target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}


extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = [Element]()
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

extension Array {
    func decompose() -> (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

extension Double {
    func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Double {
    func roundDownTo(_ multiplier: Double) -> Double{
        let fractionNum = self / Double(multiplier)
        return Double(floor(fractionNum)) * multiplier
    }
}

extension Array where Element: Equatable {
    mutating func appendUniqueObject(_ object: Iterator.Element) {
        if contains(object) == false {
            append(object)
        }
    }
}

extension Dictionary {

    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }

    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

extension String {
    var doubleValue: Double? {
        return Double(self)
    }
    var floatValue: Float? {
        return Float(self)
    }
    var integerValue: Int? {
        return Int(self)
    }
}
