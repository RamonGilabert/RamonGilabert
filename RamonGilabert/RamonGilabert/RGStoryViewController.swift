import UIKit

class RGStoryViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
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
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.TableViewConstants.Identifier) as! UITableViewCell
        cell.textLabel?.text = Story.FirstParagraph
        cell.textLabel?.numberOfLines = 1000
        cell.textLabel?.font = UIFont_WWDC.titleFont()

        return cell
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
        } else if yOffset < -90 {
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
            self.backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, 90)
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
