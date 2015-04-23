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

    class internal func titleBlogPost() -> UIFont {
        return UIFont(name: "AvenirNextCondensed-Bold", size: 25 * Constant.Size.RelationHeights)!
    }

    class internal func mainTextBlogPost() -> UIFont {
        if floor(Constant.Size.RelationHeights) == 0 {
            return UIFont(name: "HelveticaNeue-Light", size: 15 * 1.15)!
        }

        return UIFont(name: "HelveticaNeue-Light", size: 15 * floor(Constant.Size.RelationHeights) * 1.15)!
    }

    class internal func commentTextImageBlogPost() -> UIFont {
        if floor(Constant.Size.RelationHeights) == 0 {
            return UIFont(name: "Helvetica-Oblique", size: 13)!
        }
        
        return UIFont(name: "Helvetica-Oblique", size: 13 * floor(Constant.Size.RelationHeights))!
    }

    class internal func percentageSkills() -> UIFont {
        return UIFont(name: "AvenirNextCondensed-Medium", size: 30 * Constant.Size.RelationHeights * 1.15)!
    }

    class internal func skillInSkills() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 18 * Constant.Size.RelationHeights)!
    }

    class internal func explanationInSkills() -> UIFont {
        if floor(Constant.Size.RelationHeights) == 0 {
            return UIFont(name: "AvenirNext-Regular", size: 17 * 1.15)!
        }

        return UIFont(name: "AvenirNext-Regular", size: 17 * floor(Constant.Size.RelationHeights) * 1.15)!
    }

    class internal func titleInProjects() -> UIFont {
        return UIFont(name: "Libertad", size: 22 * Constant.Size.RelationHeights)!
    }

    class internal func subtitleInProjects() -> UIFont {
        return UIFont(name: "Libertad", size: 14 * Constant.Size.RelationHeights)!
    }

    class internal func explanationInProjects() -> UIFont {
        if floor(Constant.Size.RelationHeights) == 0 || Constant.Size.RelationHeights < 1.1 {
            return UIFont(name: "Libertad", size: 14 * (Constant.Size.RelationHeights + 0.2))!
        }

        return UIFont(name: "Libertad", size: 12 * Constant.Size.RelationHeights * 1.55)!
    }

    class internal func titleTips() -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: 16 * Constant.Size.RelationHeights)!
    }
}
