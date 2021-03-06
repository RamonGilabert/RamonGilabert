import UIKit

class RGSkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = ViewModel()
    var boolValue = false
    var tableView = UITableView()
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
        return Skills.ArrayWithSkills.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.TableViewSkillVariables.Identifier) as! RGSkillsCustomTableViewCell

        for view in cell.contentView.subviews as! [UIView] {
            view.removeFromSuperview()
        }

        if indexPath.row == 6 {
            cell.addBottomImage(Skills.ArrayWithSkills[indexPath.row] as! String)
        } else if indexPath.row == 4 {
            cell.addExplanation(Skills.ArrayWithSkills[indexPath.row] as! String)
        } else if indexPath.row == 3 || indexPath.row == 5 {
            cell.addSeparator()
        } else if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 {
            cell.addGraphsForRow(Skills.ArrayWithSkills[indexPath.row] as! NSDictionary)
        }

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 6 {
            return Constant.TableViewSkillVariables.HeightBottomImage + Constant.TableViewSkillVariables.MinimumPadding
        } else if indexPath.row == 4 {
            return self.viewModel.setAttributedLabelInExplanation(Skills.ArrayWithSkills[indexPath.row] as! String).frame.height + Constant.TableViewSkillVariables.MinimumPadding/1.5
        } else if indexPath.row == 3 || indexPath.row == 5 {
            return Constant.TableViewSkillVariables.MinimumPadding as CGFloat
        } else {
            return Constant.TableViewSkillVariables.HeightCellGraphs
        }
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        var cell = cell as! RGSkillsCustomTableViewCell

        if indexPath.row == 3 || indexPath.row == 5 {
            cell.separatorView.frame.size = CGSizeMake(0, 1)
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                cell.separatorView.frame.size = CGSizeMake(Constant.Size.DeviceWidth - (Constant.TableViewSkillVariables.MinimumPadding * 2), 1)
            })
        } else if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 {
            if !self.boolValue {
                cell.leftGraph.arcEnd = 0
                cell.rightGraph.arcEnd = 0
            }
            
            cell.leftGraph.startAllAnimations()
            cell.rightGraph.startAllAnimations()
        }
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
                removeViewUpdatingOrigin(31, view: self.view, viewToMove: self.profileImageView)
            } else if yOffset < -(self.profileImageView.frame.height + 50) && arrayWithSubviewsView.containsObject(self.profileImageView) {
                removeViewUpdatingOrigin(yOffset - (yOffset + self.profileImageView.frame.height)/2, view: self.tableView, viewToMove: self.profileImageView)
            } else if yOffset < -(self.profileImageView.frame.height + 50) {
                self.profileImageView.frame.origin.y = yOffset - (yOffset + self.profileImageView.frame.height)/2
            }

            self.networkImageView.alpha = -yOffset/Constant.TableViewSkillVariables.HeightHeaderView
        }
    }

    // MARK: Helper methods

    func removeViewUpdatingOrigin(origin: CGFloat, view: UIView, viewToMove: UIView) {
        viewToMove.removeFromSuperview()
        viewToMove.frame.origin.y = origin
        view.addSubview(viewToMove)
    }
}
