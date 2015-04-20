import UIKit

class RGStoryCustomTableViewCell: UITableViewCell {

    // MARK: Initializers

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.textStory)
        self.addSubview(self.imageViewStory)
        self.addSubview(self.commentImage)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Getters

    let imageViewStory: UIImageView = {
        var imageView = UIImageView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.TableViewConstants.HeightOfImages))

        return imageView
    }()

    let textStory: UILabel = {
        var label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.mainTextBlogPost()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping

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
        self.textStory.sizeToFit()
        self.textStory.frame = CGRectMake(self.textStory.frame.origin.x, self.textStory.frame.origin.y, self.textStory.frame.width, self.textStory.frame.height + Constant.TableViewConstants.MinimumPadding)
        self.addSubview(self.textStory)
    }

    func addImage(image: String) {
        self.imageViewStory.image = UIImage(named: image)
        self.addSubview(self.imageViewStory)
    }

    func addComment(text: String) {
        self.commentImage.text = text
        self.textStory.sizeToFit()
        self.addSubview(self.commentImage)
    }
}
