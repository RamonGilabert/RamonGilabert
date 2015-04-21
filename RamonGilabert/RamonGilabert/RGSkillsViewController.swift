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

        self.imageViewHeader = self.viewModel.setHeaderViewSkills(self.tableView, image: "header-image-skills")
        self.networkImageView = self.viewModel.setHeaderViewSkills(self.tableView, image: "network-image-skills")
        self.profileImageView = self.viewModel.setProfileImageSkills(self.tableView)
    }

    // MARK: TableView methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

    // MARK: ScrollView methods

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let arrayWithSubviewsTableView = self.tableView.subviews as NSArray
        let arrayWithSubviewsView = self.view.subviews as NSArray

        if yOffset < -Constant.TableViewSkillVariables.HeightHeaderView {
            var backgroundImageViewFrame = self.imageViewHeader.frame
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            var profileImageViewFrame = self.profileImageView.frame
            profileImageViewFrame.size.height = (115 * Constant.Size.RelationHeights/1.15) + (-yOffset - Constant.TableViewSkillVariables.HeightHeaderView)/2
            profileImageViewFrame.size.width = profileImageViewFrame.height
            profileImageViewFrame.origin.y = yOffset - (yOffset + profileImageViewFrame.height)/2
            profileImageViewFrame.origin.x = (Constant.Size.DeviceWidth - profileImageViewFrame.size.width)/2

            self.imageViewHeader.frame = backgroundImageViewFrame
            self.networkImageView.frame = backgroundImageViewFrame
            self.profileImageView.frame = profileImageViewFrame

            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        } else if yOffset > -Constant.TableViewSkillVariables.HeightHeaderView {
            var backgroundImageViewFrame = self.imageViewHeader.frame
            backgroundImageViewFrame.origin.y = yOffset
            backgroundImageViewFrame.size.height = -yOffset

            self.imageViewHeader.frame = backgroundImageViewFrame
            self.networkImageView.frame = backgroundImageViewFrame

            if yOffset > -(self.profileImageView.frame.height + 50) && arrayWithSubviewsTableView.containsObject(self.profileImageView) {
                println("Sup")
                self.profileImageView.removeFromSuperview()
                self.view.addSubview(self.profileImageView)
                self.profileImageView.frame.origin.y = 31
            } else if yOffset < -(self.profileImageView.frame.height + 50) && arrayWithSubviewsView.containsObject(self.profileImageView) {
                self.profileImageView.removeFromSuperview()
                self.profileImageView.frame.origin.y = yOffset - (yOffset + self.profileImageView.frame.height)/2
                self.tableView.addSubview(self.profileImageView)
            } else if yOffset < -(self.profileImageView.frame.height + 50) {
                self.profileImageView.frame.origin.y = yOffset - (yOffset + self.profileImageView.frame.height)/2
            }

            self.networkImageView.alpha = -yOffset/Constant.TableViewSkillVariables.HeightHeaderView - 0.25
        } else {
            
        }
    }
}
