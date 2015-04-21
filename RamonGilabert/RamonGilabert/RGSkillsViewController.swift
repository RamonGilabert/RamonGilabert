import UIKit

class RGSkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView()
    var scrollView = UIScrollView()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = self.viewModel
    }

    // MARK: TableView methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

    // MARK: ScrollView methods

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y

//        if yOffset < -Constant.Size.DeviceHeight {
//            backgroundImageViewFrame.origin.y = yOffset
//            backgroundImageViewFrame.size.height = -yOffset
//
//            self.backgroundImageView.frame = backgroundImageViewFrame
//            self.titleLabel.frame.origin.y = (Constant.Size.DeviceHeight - self.titleLabel.frame.height) / 2 - 35
//            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19
//        } else if yOffset < -Constant.Positioning.HeightOfHeaderStory {
//            self.titleLabel.frame.origin.y = (self.backgroundImageView.frame.height - self.titleLabel.frame.height) / 2 - 35
//            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 19
//
//            if !arrayOfSubviews.containsObject(self.backgroundImageView) {
//                self.backgroundImageView.removeFromSuperview()
//                self.backgroundImageView.frame.origin = CGPointMake(0, 0)
//                self.tableView.addSubview(self.backgroundImageView)
//                animateViews(1)
//            }
//            self.blurView.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 3
//
//            backgroundImageViewFrame.origin.y = 0
//            backgroundImageViewFrame.size.height = yOffset
//
//            self.backgroundImageView.frame = backgroundImageViewFrame
//        } else if arrayOfSubviews.containsObject(self.backgroundImageView) && yOffset < 50 {
//            self.backgroundImageView.removeFromSuperview()
//            self.backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Positioning.HeightOfHeaderStory)
//            self.view.addSubview(self.backgroundImageView)
//            self.view.addSubview(self.secondaryLabel)
//            self.secondaryLabel.transform = CGAffineTransformMakeTranslation(0, -100)
//            animateViews(0)
//        }
    }
}
