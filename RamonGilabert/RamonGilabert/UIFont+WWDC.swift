import UIKit

class UIFont_WWDC: NSObject {

    class internal func titleFont() -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: 24.0 * Constant.Size.RelationHeights)!
    }

    class internal func menuButtonFont() -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: 20.0 * Constant.Size.RelationHeights)!
    }
   
}
