import UIKit

class RGSkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView()
    var scrollView = UIScrollView()
    var imageViewHeader = UIImageView()
    var networkImageView = UIImageView()
    var profileImageView = UIImageView()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = self.viewModel.setSkillTableView(self.view, delegate: self, dataSource: self)

        self.imageViewHeader = UIImageView(frame: CGRectMake(0, -Constant.TableViewSkillVariables.HeightHeaderView, Constant.Size.DeviceWidth, Constant.TableViewSkillVariables.HeightHeaderView))
        self.imageViewHeader.image = UIImage(named: "header-image-skills")
        self.imageViewHeader.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageViewHeader.clipsToBounds = true
        self.tableView.addSubview(self.imageViewHeader)

        self.networkImageView = UIImageView(frame: CGRectMake(0, -Constant.TableViewSkillVariables.HeightHeaderView, Constant.Size.DeviceWidth, Constant.TableViewSkillVariables.HeightHeaderView))
        self.networkImageView.image = UIImage(named: "network-image-skills")
        self.networkImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.networkImageView.clipsToBounds = true
        self.tableView.addSubview(self.networkImageView)

        self.profileImageView = UIImageView(frame: CGRectMake((Constant.Size.DeviceWidth - (115 * Constant.Size.RelationHeights/1.15))/2, -Constant.TableViewSkillVariables.HeightHeaderView + (Constant.TableViewSkillVariables.HeightHeaderView - (115 * Constant.Size.RelationHeights/1.15))/2, 115 * Constant.Size.RelationHeights/1.15, 115 * Constant.Size.RelationHeights/1.15))
        self.profileImageView.image = UIImage(named: "profile-image-skills")
        self.profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        self.profileImageView.layer.borderColor = UIColor(red:0.51, green:0.82, blue:0.2, alpha:1).CGColor
        self.profileImageView.layer.borderWidth = 4
        self.tableView.addSubview(self.profileImageView)

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

        if yOffset < -Constant.TableViewSkillVariables.HeightHeaderView {
            var backgroundImageViewFrame = self.imageViewHeader.frame
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            var profileImageViewFrame = self.profileImageView.frame
            profileImageViewFrame.size.height = (115 * Constant.Size.RelationHeights/1.15) + (-yOffset - Constant.TableViewSkillVariables.HeightHeaderView)
            profileImageViewFrame.size.width = profileImageViewFrame.height
            profileImageViewFrame.origin.y = yOffset - (yOffset + profileImageViewFrame.height)/2
            println(yOffset)
            profileImageViewFrame.origin.x = (Constant.Size.DeviceWidth - profileImageViewFrame.size.width)/2

            self.imageViewHeader.frame = backgroundImageViewFrame
            self.networkImageView.frame = backgroundImageViewFrame
            self.profileImageView.frame = profileImageViewFrame

            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        }
    }
}
