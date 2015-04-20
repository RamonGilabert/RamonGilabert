import UIKit

class RGStoryCustomTableViewCell: UITableViewCell {

    // MARK: Initializers

    override func awakeFromNib() {
        super.awakeFromNib()


    }

    // MARK: Getters

    let imageViewStory: UIImageView = {
        var imageView = UIImageView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.TableViewConstants.HeightOfImages))

        return imageView
    }()

    let textStory: UILabel = {
        var label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.mainTextBlogPost()

        return label
    }()

    let commentImage: UILabel = {
        var label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding/2, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.commentTextImageBlogPost()
        label.textColor = UIColor_WWDC.commentsStoryColor()
        label.textAlignment = NSTextAlignment.Center

        return label
    }()

    // MARK: Methods to layout

    func addParagraph(text: String) {
        self.textStory.text = text
    }

    func addImage(image: String) {
        self.imageViewStory.image = UIImage(named: image)
    }

    func addComment(text: String) {
        self.commentImage.text = text
    }
}
