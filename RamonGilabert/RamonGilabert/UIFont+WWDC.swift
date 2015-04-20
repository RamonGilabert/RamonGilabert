import UIKit

class UIFont_WWDC: NSObject {

    class internal func titleFont() -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: 24.0 * Constant.Size.RelationHeights)!
    }

    class internal func menuButtonFont() -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: 20.0 * Constant.Size.RelationHeights)!
    }

    class internal func titleStoryFont() -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 40 * Constant.Size.RelationHeights)!
    }

    class internal func subTitleStoryFont() -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: 16 * Constant.Size.RelationHeights)!
    }

    class internal func secondaryTitleFont() -> UIFont {
        return UIFont(name: "AvenirNextCondensed-Medium", size: 26 * Constant.Size.RelationHeights)!
    }

    class internal func mainTextBlogPost() -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: 15 * Constant.Size.RelationHeights)!
    }

    class internal func commentTextImageBlogPost() -> UIFont {
        return UIFont(name: "Helvetica-Oblique", size: 12 * Constant.Size.RelationHeights)!
    }
}
