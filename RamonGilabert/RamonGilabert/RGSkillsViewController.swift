import UIKit

class RGSkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var tableView = UITableView()
    var scrollView = UIScrollView()
    var imageViewHeader = UIImageView()
    var networkImageView = UIImageView()
    var profileImageView = UIImageView()
    var circleGraph = CircleGraphView()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = self.viewModel.setSkillTableView(self.view, delegate: self, dataSource: self)

        self.imageViewHeader = self.viewModel.setHeaderViewSkills(self.tableView, image: "header-image-skills")
        self.networkImageView = self.viewModel.setHeaderViewSkills(self.tableView, image: "network-image-skills")
        self.profileImageView = self.viewModel.setProfileImageSkills(self.tableView)

        circleGraph.arcWidth = 15
        circleGraph.endArc = 0.5
        circleGraph.frame = CGRectMake(0, 0, 100, 100)
        circleGraph.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(circleGraph)

    }

    // MARK: TableView methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Skills.ArrayWithSkills.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.TableViewSkillVariables.Identifier) as! RGSkillsCustomTableViewCell

        if indexPath.row == 6 {

        } else if indexPath.row == 4 {

        } else if indexPath.row == 3 || indexPath.row == 5 {

        } else {
            
        }

        return cell
    }

    // MARK: ScrollView methods

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let arrayWithSubviewsTableView = self.tableView.subviews as NSArray
        let arrayWithSubviewsView = self.view.subviews as NSArray

        var backgroundImageViewFrame = self.imageViewHeader.frame
        backgroundImageViewFrame.origin.y = yOffset
        backgroundImageViewFrame.size.height = -yOffset

        if yOffset < -Constant.TableViewSkillVariables.HeightHeaderView {
            var profileImageViewFrame = self.profileImageView.frame
            profileImageViewFrame.size.height = Constant.TableViewSkillVariables.ProfileImageSize + (-yOffset - Constant.TableViewSkillVariables.HeightHeaderView)/2
            profileImageViewFrame.size.width = profileImageViewFrame.height
            profileImageViewFrame.origin.y = yOffset - (yOffset + profileImageViewFrame.height)/2
            profileImageViewFrame.origin.x = (Constant.Size.DeviceWidth - profileImageViewFrame.size.width)/2

            self.imageViewHeader.frame = backgroundImageViewFrame
            self.networkImageView.frame = backgroundImageViewFrame
            self.profileImageView.frame = profileImageViewFrame

            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        } else if yOffset > -Constant.TableViewSkillVariables.HeightHeaderView {
            if yOffset > -(self.profileImageView.frame.height + 50)/2 && arrayWithSubviewsTableView.containsObject(self.imageViewHeader) {
                self.imageViewHeader.removeFromSuperview()
                self.view.insertSubview(self.imageViewHeader, belowSubview: self.profileImageView)
                self.imageViewHeader.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, (self.profileImageView.frame.height + 50)/2)
            } else if yOffset < -(self.profileImageView.frame.height + 50)/2 && arrayWithSubviewsView.containsObject(self.imageViewHeader) {
                self.imageViewHeader.removeFromSuperview()
                self.imageViewHeader.frame.origin.y = -self.imageViewHeader.frame.height
                self.tableView.insertSubview(self.imageViewHeader, belowSubview: self.networkImageView)
                self.imageViewHeader.frame = backgroundImageViewFrame
                self.networkImageView.frame = backgroundImageViewFrame
            } else if yOffset < -(self.profileImageView.frame.height + 50)/2 {
                self.imageViewHeader.frame = backgroundImageViewFrame
                self.networkImageView.frame = backgroundImageViewFrame
            }

            if yOffset > -(self.profileImageView.frame.height + 50) && arrayWithSubviewsTableView.containsObject(self.profileImageView) {
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

            self.networkImageView.alpha = -yOffset/Constant.TableViewSkillVariables.HeightHeaderView
        }
    }
}
