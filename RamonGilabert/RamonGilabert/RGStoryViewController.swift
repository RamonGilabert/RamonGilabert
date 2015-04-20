import UIKit

struct TableViewConstants {
    static let Identifier = "CellID"
}

class RGStoryViewController: UITableViewController, UIScrollViewDelegate {

    let viewModel = ViewModel()
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

        var backgroundImageViewFrame = self.backgroundImageView.frame

        if (yOffset < -Constant.Size.DeviceHeight) {
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
        } else {
            self.blurView.alpha = ((yOffset + Constant.Size.DeviceHeight)/Constant.Size.DeviceHeight) * 3

            backgroundImageViewFrame.origin.y = 0
            backgroundImageViewFrame.size.height = yOffset

            self.backgroundImageView.frame = backgroundImageViewFrame
        }
    }
}
