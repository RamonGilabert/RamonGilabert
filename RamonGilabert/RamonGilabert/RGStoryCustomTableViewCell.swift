import UIKit

class RGStoryCustomTableViewCell: UITableViewCell {

    let viewModel = ViewModel()
    var textStory = UILabel()
    
    // MARK: Initializers

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.textStory)
        self.contentView.addSubview(self.imageViewStory)
        self.contentView.addSubview(self.commentImage)
        self.contentView.addSubview(self.titleStory)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Getters

    let titleStory: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.titleBlogPost()
        label.textColor = UIColor_WWDC.almostBlackColor()
        
        return label
    }()

    let imageViewStory: UIImageView = {
        let imageView = UIImageView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.TableViewConstants.HeightOfImages))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        return imageView
    }()

    let commentImage: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.commentTextImageBlogPost()
        label.textColor = UIColor_WWDC.commentsStoryColor()
        label.textAlignment = NSTextAlignment.Center

        return label
    }()

    // MARK: Methods to layout

    func addParagraph(text: String) {
        self.textStory = self.viewModel.textLabelInBlogPost(text)
        self.contentView.addSubview(self.textStory)
    }

    func addImage(image: String) {
        self.imageViewStory.image = UIImage(named: image)
        self.contentView.addSubview(self.imageViewStory)
    }

    func addComment(text: String) {
        self.commentImage.text = text
        self.commentImage.sizeToFit()
        self.commentImage.frame = CGRectMake(0, self.commentImage.frame.origin.y, Constant.Size.DeviceWidth, self.commentImage.frame.height)
        self.contentView.addSubview(self.commentImage)
    }

    func addTitle(text: String) {
        self.titleStory.text = text
        self.titleStory.sizeToFit()
        self.titleStory.frame = CGRectMake(Constant.TableViewConstants.MinimumPadding, self.titleStory.frame.origin.y, Constant.Size.DeviceWidth, self.titleStory.frame.height)
        self.contentView.addSubview(self.titleStory)
    }
}
