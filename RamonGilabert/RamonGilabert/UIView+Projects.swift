import UIKit

class UIView_Projects: UIView {

    let viewModel = ViewModel()
    var titleTopImage = UILabel()
    var subtitleTopImage = UILabel()
    var imageViewProject = UIImageView()
    var labelExplanationProject = UILabel()

    override func drawRect(rect: CGRect) {
        self.titleTopImage = self.viewModel.setTitleProject(self)
        self.subtitleTopImage = self.viewModel.setSubtitleProject(self)
        self.imageViewProject = self.viewModel.setImageViewProject(self)
        self.labelExplanationProject = self.viewModel.setExplanationProject(self)
    }
}
