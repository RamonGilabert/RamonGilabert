import UIKit

class RGSkillsCustomTableViewCell: UITableViewCell {

    // MARK: Initializers

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Getters

    let leftGraph: UIView_Graph = {
        let view = UIView_Graph(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.SizeOfGraph, Constant.TableViewSkillVariables.SizeOfGraph))
        view.arcWidth = Constant.TableViewSkillVariables.SizeOfGraphWidth

        return view
    }()

    let rightGraph: UIView_Graph = {
        let view = UIView_Graph(frame: CGRectMake(Constant.Size.DeviceWidth - Constant.TableViewSkillVariables.SizeOfGraph - Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.SizeOfGraph, Constant.TableViewSkillVariables.SizeOfGraph))
        view.arcWidth = Constant.TableViewSkillVariables.SizeOfGraphWidth

        return view
    }()

    let labelPercentageLeft: UILabel = {
        let label = UILabel(frame: CGRectMake(0, (Constant.TableViewSkillVariables.MinimumPadding * 2) + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))

        return label
    }()

    let labelSkillLeft: UILabel = {
        let label = UILabel(frame: CGRectMake(0, (Constant.TableViewSkillVariables.MinimumPadding * 2) + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.skillInSkills()

        return label
    }()

    let labelPercentageRight: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.Size.DeviceWidth/2, (Constant.TableViewSkillVariables.MinimumPadding * 2) + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))

        return label
    }()

    let labelSkillRight: UILabel = {
        let label = UILabel(frame: CGRectMake(0, (Constant.TableViewSkillVariables.MinimumPadding * 2) + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.skillInSkills()

        return label
    }()

    let labelExplanation: UILabel = {
        let label = UILabel(frame: CGRectMake(0, 0, 0, 0))

        return label
    }()

//    let separatorView: UIView = {
//
//    }()

    // MARK: Layout methods

    func addGraphsForRow(dictionary: NSDictionary) {
        self.leftGraph.endArc = 0 as CGFloat
        self.leftGraph.arcColor = dictionary["leftColor"] as! UIColor
        self.leftGraph.backgroundColor = UIColor.clearColor()

        let percentage = (dictionary["left"] as! CGFloat) * 100

        self.labelSkillLeft.text = dictionary["leftText"] as? String

        self.rightGraph.endArc = 0 as CGFloat
        self.rightGraph.arcColor = dictionary["rightColor"] as! UIColor
        self.rightGraph.backgroundColor = UIColor.clearColor()

        self.contentView.addSubview(self.leftGraph)
        self.contentView.addSubview(self.labelSkillLeft)
        self.contentView.addSubview(self.rightGraph)
    }
}
