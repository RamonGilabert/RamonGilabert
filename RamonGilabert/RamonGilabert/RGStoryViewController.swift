import UIKit

class RGStoryViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
    var blurView = UIVisualEffectView()
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()

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

        let titleLabel = UILabel(frame: CGRectMake(20, 0, Constant.Size.DeviceWidth - 40, 0))
        titleLabel.text = "Everyone has a story"
        titleLabel.font = UIFont_WWDC.titleStoryFont()
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.sizeToFit()
        titleLabel.frame = CGRectMake(20, (Constant.Size.DeviceHeight - titleLabel.frame.height) / 2 - 35, titleLabel.frame.width, titleLabel.frame.height)

        let subtitleLabel = UILabel(frame: CGRectMake(20, titleLabel.frame.origin.y + titleLabel.frame.size.height + 19, Constant.Size.DeviceWidth - 40, 18))
        subtitleLabel.text = "Here's a little trip into main, dream..."
        subtitleLabel.font = UIFont_WWDC.subTitleStoryFont()
        subtitleLabel.textColor = UIColor.whiteColor()
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.minimumScaleFactor = 0

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
