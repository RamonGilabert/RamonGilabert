import UIKit

class RGStoryViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView()
    var blurView = UIVisualEffectView()
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var secondaryLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImageView = self.viewModel.setCoverImageWithGradient()
        self.blurView = self.viewModel.setBlurView(self.backgroundImageView)
        self.blurView.alpha = 0

        self.tableView = self.viewModel.setFullScreenTableView(self.view, delegate: self, dataSource: self)
        self.tableView.addSubview(backgroundImageView)

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

        if indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 8 || indexPath.row == 12 {
        } else {

        }

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == 1 || indexPath == 5 || indexPath == 8 || indexPath == 12 {
            return 160
        } else {
            let labelOfStory = UILabel(frame: CGRectMake(20, 20, Constant.Size.DeviceWidth - 40, 0))
            labelOfStory.text = Story.ArrayWithStory[indexPath.row]
            labelOfStory.font = UIFont_WWDC.mainTextBlogPost()
            labelOfStory.lineBreakMode = NSLineBreakMode.ByWordWrapping
            labelOfStory.numberOfLines = 0
            labelOfStory.sizeToFit()
            return labelOfStory.frame.height
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

            self.titleLabel.frame.origin.y = (Constant.Size.DeviceHeight - self.titleLabel.frame.height) / 2 - 35
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19
        } else if yOffset < -Constant.Positioning.HeightOfHeaderStory {
            self.titleLabel.frame.origin.y = (self.backgroundImageView.frame.height - self.titleLabel.frame.height) / 2 - 35
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19

            if !arrayOfSubviews.containsObject(self.backgroundImageView) {
                self.backgroundImageView.removeFromSuperview()
                self.backgroundImageView.frame.origin = CGPointMake(0, 0)
                self.tableView.addSubview(self.backgroundImageView)

                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.titleLabel.alpha = 1
                    self.subtitleLabel.alpha = 1
                    self.secondaryLabel.alpha = 0
                }, completion: { finished in
                    self.secondaryLabel.transform = CGAffineTransformMakeTranslation(0, -100)
                })
            }
            self.blurView.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 3

            backgroundImageViewFrame.origin.y = 0
            backgroundImageViewFrame.size.height = yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
        } else if arrayOfSubviews.containsObject(self.backgroundImageView) && yOffset < 50 {
            self.backgroundImageView.removeFromSuperview()
            self.backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Positioning.HeightOfHeaderStory)
            self.view.addSubview(self.backgroundImageView)
            self.view.addSubview(self.secondaryLabel)

            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.titleLabel.alpha = 0
                self.subtitleLabel.alpha = 0
                self.secondaryLabel.alpha = 1
                self.secondaryLabel.transform = CGAffineTransformIdentity
            })
        }
    }
}
