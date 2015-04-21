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

    // MARK: Layout methods

    func addGraphsForRow(dictionary: NSDictionary) {
        self.leftGraph.endArc = 0
        self.leftGraph.arcColor = dictionary["leftColor"] as! UIColor
        self.leftGraph.backgroundColor = UIColor.clearColor()
        self.rightGraph.endArc = dictionary["right"] as! CGFloat
        self.rightGraph.arcColor = dictionary["rightColor"] as! UIColor
        self.rightGraph.backgroundColor = UIColor.clearColor()

        self.contentView.addSubview(self.leftGraph)
        self.contentView.addSubview(self.rightGraph)
    }
}
