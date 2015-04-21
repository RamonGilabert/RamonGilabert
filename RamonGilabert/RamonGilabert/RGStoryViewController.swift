import UIKit

class RGStoryViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView()
    var blurView = UIImageView()
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var secondaryLabel = UILabel()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImageView = self.viewModel.setCoverImageWithGradient()
        self.blurView = self.viewModel.setBlurView()
        self.blurView.alpha = 0

        self.tableView = self.viewModel.setFullScreenTableView(self.view, delegate: self, dataSource: self)
        self.tableView.addSubview(backgroundImageView)
        self.tableView.addSubview(self.blurView)

        self.titleLabel = self.viewModel.setTitleBlogPost(self.view)
        self.subtitleLabel = self.viewModel.setSubtitleBlogPost(self.view)
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 19
        self.secondaryLabel = self.viewModel.setSecondaryBlogPostLabel()
    }

    // MARK: TableView methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Story.ArrayWithStory.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Constant.TableViewConstants.Identifier) as! RGStoryCustomTableViewCell

        for view in cell.contentView.subviews as! [UIView] {
            view.removeFromSuperview()
        }

        if indexPath.row == 1 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14 {
            cell.addImage(Story.ArrayWithStory[indexPath.row])
        } else if indexPath.row == 2 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 {
            cell.addComment(Story.ArrayWithStory[indexPath.row])
        } else if indexPath.row == 3 || indexPath.row == 8 {
            cell.addTitle(Story.ArrayWithStory[indexPath.row])
        } else {
            cell.addParagraph(Story.ArrayWithStory[indexPath.row])
        }

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14 {
            return Constant.TableViewConstants.HeightOfImages
        } else if indexPath.row == 2 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 {
            return 40
        } else if indexPath.row == 3 || indexPath.row == 8 {
            return 50
        } else {
            return self.viewModel.textLabelInBlogPost(Story.ArrayWithStory[indexPath.row]).frame.height + (Constant.TableViewConstants.MinimumPadding * 2)
        }
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14 {
            var cell = cell as! RGStoryCustomTableViewCell
            cell.imageViewStory.transform = CGAffineTransformMakeScale(0.5, 0.5)
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                cell.imageViewStory.transform = CGAffineTransformIdentity
            })
        }
    }

    // MARK: ScrollView methods

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        var backgroundImageViewFrame = self.backgroundImageView.frame
        let arrayOfSubviews = self.tableView.subviews as NSArray

        if yOffset < -Constant.Size.DeviceHeight {
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
            self.blurView.frame = backgroundImageViewFrame
            self.titleLabel.frame.origin.y = (Constant.Size.DeviceHeight - self.titleLabel.frame.height) / 2 - 35
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19
        } else if yOffset < -Constant.Positioning.HeightOfHeaderStory {
            self.titleLabel.frame.origin.y = (self.backgroundImageView.frame.height - self.titleLabel.frame.height) / 2 - 35
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19

            if !arrayOfSubviews.containsObject(self.backgroundImageView) {
                self.backgroundImageView.removeFromSuperview()
                self.blurView.removeFromSuperview()
                self.backgroundImageView.frame.origin = CGPointMake(0, 0)
                self.blurView.frame.origin = CGPointMake(0, 0)
                self.tableView.addSubview(self.backgroundImageView)
                self.tableView.addSubview(self.blurView)
                animateViews(1)
            }
            self.blurView.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 3

            backgroundImageViewFrame.origin.y = 0
            backgroundImageViewFrame.size.height = yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
            self.blurView.frame = backgroundImageViewFrame
        } else if arrayOfSubviews.containsObject(self.backgroundImageView) && yOffset < 50 {
            self.backgroundImageView.removeFromSuperview()
            self.blurView.removeFromSuperview()
            self.backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Positioning.HeightOfHeaderStory)
            self.blurView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Positioning.HeightOfHeaderStory)
            self.view.addSubview(self.backgroundImageView)
            self.view.addSubview(self.blurView)
            self.view.addSubview(self.secondaryLabel)
            self.secondaryLabel.transform = CGAffineTransformMakeTranslation(0, -100)
            animateViews(0)
        }
    }

    // MARK: Helper methods

    func animateViews(value: CGFloat) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.titleLabel.alpha = value
            self.subtitleLabel.alpha = value
            self.secondaryLabel.alpha = (1 - value)
            self.secondaryLabel.transform = CGAffineTransformIdentity
        })
    }
}
