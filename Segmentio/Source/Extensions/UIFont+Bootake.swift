import Foundation

//["NotoSansKR-Thin", "NotoSansKR-Black", "NotoSansKR-Medium", "NotoSansKR-Bold", "NotoSansKR-Regular", "NotoSansKR-Light"]

extension UIFont {
    
    func activeFont() -> UIFont {
        if let font = UIFont(name: "NotoSansKR-Regular", size: 13) {
            return font
        } else {
            return UIFont.systemFontOfSize(13)
        }
    }
    
    func inactiveFont() -> UIFont {
        if let font = UIFont(name: "NotoSansKR-Light", size: 13) {
            return font
        } else {
            return UIFont.systemFontOfSize(13)
        }
    }
}