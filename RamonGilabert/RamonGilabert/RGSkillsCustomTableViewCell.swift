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
}
