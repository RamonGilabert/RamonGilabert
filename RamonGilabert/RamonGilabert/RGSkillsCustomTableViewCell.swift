import UIKit

class RGSkillsCustomTableViewCell: UITableViewCell {

    let viewModel = ViewModel()

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
        let label = UILabel(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding + Constant.TableViewSkillVariables.SizeOfGraphWidth, Constant.TableViewSkillVariables.MinimumPadding + Constant.TableViewSkillVariables.SizeOfGraphWidth, Constant.TableViewSkillVariables.SizeOfGraph - (Constant.TableViewSkillVariables.SizeOfGraphWidth * 2), Constant.TableViewSkillVariables.SizeOfGraph - (Constant.TableViewSkillVariables.SizeOfGraphWidth * 2)))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.percentageSkills()

        return label
    }()

    let labelSkillLeft: UILabel = {
        let label = UILabel(frame: CGRectMake(0, Constant.TableViewSkillVariables.MinimumPadding*1.25 + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.skillInSkills()

        return label
    }()

    let labelPercentageRight: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding + Constant.TableViewSkillVariables.SizeOfGraphWidth + Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding + Constant.TableViewSkillVariables.SizeOfGraphWidth, Constant.TableViewSkillVariables.SizeOfGraph - (Constant.TableViewSkillVariables.SizeOfGraphWidth * 2), Constant.TableViewSkillVariables.SizeOfGraph - (Constant.TableViewSkillVariables.SizeOfGraphWidth * 2)))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.percentageSkills()

        return label
    }()

    let labelSkillRight: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding*1.25 + Constant.TableViewSkillVariables.SizeOfGraph, Constant.Size.DeviceWidth/2, Constant.TableViewSkillVariables.MinimumPadding * 1.5))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor_WWDC.skillsColor()
        label.font = UIFont_WWDC.skillInSkills()

        return label
    }()

    let separatorView: UIView = {
        let view = UIView(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.MinimumPadding - 0.5, Constant.Size.DeviceWidth - (Constant.TableViewSkillVariables.MinimumPadding * 2), 1))
        view.backgroundColor = UIColor_WWDC.skillsColor()

        return view
    }()

    let bottomImage: UIImageView = {
        let imageView = UIImageView(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding/2, Constant.TableViewSkillVariables.MinimumPadding/1.5, Constant.Size.DeviceWidth - Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.HeightBottomImage))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()

    var labelExplanation: UILabel = {
        let label = UILabel(frame: CGRectMake(Constant.TableViewSkillVariables.MinimumPadding, Constant.TableViewSkillVariables.MinimumPadding/1.5, Constant.Size.DeviceWidth - (Constant.TableViewSkillVariables.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.explanationInSkills()
        label.textColor = UIColor_WWDC.skillsColor()
        label.numberOfLines = 0

        return label
    }()

    // MARK: Layout methods

    func addGraphsForRow(dictionary: NSDictionary) {
        self.leftGraph.endArc = 0 as CGFloat
        self.leftGraph.arcColor = dictionary["leftColor"] as! UIColor
        self.leftGraph.backgroundColor = UIColor.clearColor()
        self.labelSkillLeft.text = dictionary["leftText"] as? String

        let percentageLeft = Int((dictionary["left"] as! CGFloat) * 100)
        self.labelPercentageLeft.text = String("\(percentageLeft)%")

        self.rightGraph.endArc = 0 as CGFloat
        self.rightGraph.arcColor = dictionary["rightColor"] as! UIColor
        self.rightGraph.backgroundColor = UIColor.clearColor()
        self.labelSkillRight.text = dictionary["rightText"] as? String

        let percentageRight = Int((dictionary["right"] as! CGFloat) * 100)
        self.labelPercentageRight.text = String("\(percentageRight)%")

        self.contentView.addSubview(self.leftGraph)
        self.contentView.addSubview(self.labelSkillLeft)
        self.contentView.addSubview(self.labelPercentageLeft)
        self.contentView.addSubview(self.rightGraph)
        self.contentView.addSubview(self.labelSkillRight)
        self.contentView.addSubview(self.labelPercentageRight)
    }

    func addSeparator() {
        self.contentView.addSubview(self.separatorView)
    }

    func addExplanation(text: String) {
        self.labelExplanation = self.viewModel.setAttributedLabelInExplanation(text)

        self.contentView.addSubview(self.labelExplanation)
    }

    func addBottomImage(image: String) {
        self.bottomImage.image = UIImage(named: image)
        
        self.contentView.addSubview(self.bottomImage)
    }
}
