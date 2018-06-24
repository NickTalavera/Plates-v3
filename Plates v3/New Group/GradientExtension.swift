import UIKit
import SwiftHEXColors
extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
//        let topColor = UIColor(red: (15/255.0), green: (118/255.0), blue: (128/255.0), alpha: 1)
//        let bottomColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
        let topColor = UIColor(hexString: "9D1B55")
        let bottomColor = UIColor(hexString: "D9595B")
        
        let gradientColors: Array <AnyObject> = [topColor!.CGColor, bottomColor!.CGColor]
        let gradientLocations: Array <AnyObject> = [0, 1]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as! [NSNumber]
        
        return gradientLayer
    }
}