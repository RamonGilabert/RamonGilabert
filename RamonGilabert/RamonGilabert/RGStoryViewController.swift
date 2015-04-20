import UIKit

struct TableViewConstants {
    static let Identifier = "CellID"
}

class RGStoryViewController: UITableViewController, UIScrollViewDelegate {

    let viewModel = ViewModel()
    let blurView = UIVisualEffectView()
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        blurView.tintColor = UIColor(white: 0, alpha: 0)
        self.blurViewContainer.backgroundColor = UIColor.whi
        self.blurViewContainer.addSubview(blurView)

        self.backgroundImageView = self.viewModel.setCoverImageWithGradient()
        self.backgroundImageView.addSubview(self.blurViewContainer)

        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: TableViewConstants.Identifier)
        self.tableView.contentInset = UIEdgeInsetsMake(Constant.Size.DeviceHeight, 0, 0, 0)
        self.tableView.addSubview(backgroundImageView)
    }

    // MARK: TableView methods

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewConstants.Identifier) as! UITableViewCell
        cell.textLabel?.text = "Sup"
        return cell
    }

    // MARK: ScrollView methods

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y

        self.blurViewContainer.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 1.5

        if (yOffset < -Constant.Size.DeviceHeight) {
            var backgroundImageViewFrame = self.backgroundImageView.frame
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
        }
    }
}
