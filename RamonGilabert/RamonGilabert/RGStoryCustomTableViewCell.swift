import UIKit

class RGStoryCustomTableViewCell: UITableViewCell {

    let imageViewStory = UIImageView()

    // MARK: Getters

    let textStory: UILabel = {
        var label = UILabel(frame: CGRectMake(Constant.Positioning.MinimumPadding, Constant.Positioning.MinimumPadding, Constant.Size.DeviceWidth - (Constant.Positioning.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.mainTextBlogPost()

        return label
    }()

    let commentImage: UILabel = {
        var label = UILabel(frame: CGRectMake(Constant.Positioning.MinimumPadding, Constant.Positioning.MinimumPadding/2, Constant.Size.DeviceWidth - (Constant.Positioning.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.commentTextImageBlogPost()
        label.textColor = UIColor_WWDC.commentsStoryColor()
        label.textAlignment = NSTextAlignment.Center

        return label
    }()



}
