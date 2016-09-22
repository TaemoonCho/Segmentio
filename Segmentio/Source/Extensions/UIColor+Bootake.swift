import UIKit

extension UIColor {
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    class func colorWithRGB(red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor.init(red, green, blue, 1.0)
    }
    
    class func indicatorColor() -> UIColor {
        return self.colorWithRGB(253, 57, 57)
    }
    
    class func borderColor() -> UIColor {
        return self.colorWithRGB(255, 255, 255)
    }
    
    class func backgroundColor() -> UIColor {
        return self.colorWithRGB(247, 247, 247)
    }
    
    class func activeTextColor() -> UIColor {
        return self.colorWithRGB(46, 46, 46)
    }
    
    class func inactiveTextColor() -> UIColor {
        return self.colorWithRGB(129, 129, 129)
    }
}
