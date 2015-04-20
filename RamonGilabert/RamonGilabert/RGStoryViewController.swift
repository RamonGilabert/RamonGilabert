import UIKit

class RGStoryViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
    var blurView = UIVisualEffectView()
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var initialFrameLabel = CGRect()
    var initialFrameSubtitle = CGRect()

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        self.blurView = UIVisualEffectView(effect: blurEffect)
        self.blurView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.blurView.alpha = 0

        self.backgroundImageView = self.viewModel.setCoverImageWithGradient()
        self.backgroundImageView.addSubview(self.blurView)

        self.tableView = self.viewModel.setFullScreenTableView(self.view, delegate: self, dataSource: self)
        self.tableView.addSubview(backgroundImageView)

        self.titleLabel = UILabel(frame: CGRectMake(20, 0, Constant.Size.DeviceWidth - 40, 0))
        self.titleLabel.text = "Everyone has a story"
        self.titleLabel.font = UIFont_WWDC.titleStoryFont()
        self.titleLabel.numberOfLines = 2
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.sizeToFit()
        self.titleLabel.frame = CGRectMake(20, (Constant.Size.DeviceHeight - titleLabel.frame.height) / 2 - 35, titleLabel.frame.width, titleLabel.frame.height)
        self.initialFrameLabel = self.titleLabel.frame

        self.subtitleLabel = UILabel(frame: CGRectMake(20, titleLabel.frame.origin.y + titleLabel.frame.size.height + 19, Constant.Size.DeviceWidth - 40, 18))
        self.subtitleLabel.text = "Here's a little trip into main, dream..."
        self.subtitleLabel.font = UIFont_WWDC.subTitleStoryFont()
        self.subtitleLabel.textColor = UIColor.whiteColor()
        self.subtitleLabel.adjustsFontSizeToFitWidth = true
        self.subtitleLabel.minimumScaleFactor = 0

        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
    }

    // MARK: TableView methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.TableViewConstants.Identifier) as! UITableViewCell
        cell.textLabel?.text = "Sup"
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
            self.titleLabel.frame.origin.y = self.initialFrameLabel.origin.y - (yOffset + Constant.Size.DeviceHeight)/4
            println(self.initialFrameLabel)
            println(self.titleLabel.frame)
            if !arrayOfSubviews.containsObject(self.backgroundImageView) {
                self.backgroundImageView.removeFromSuperview()
                self.backgroundImageView.frame.origin = CGPointMake(0, 0)
                self.tableView.addSubview(self.backgroundImageView)
            }
            self.blurView.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 3

            backgroundImageViewFrame.origin.y = 0
            backgroundImageViewFrame.size.height = yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
        } else if arrayOfSubviews.containsObject(self.backgroundImageView) && yOffset < 50 {
            self.backgroundImageView.removeFromSuperview()
            self.backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, 90)
            self.view.addSubview(self.backgroundImageView)
        }
    }
}
