import UIKit

class UIView_Projects: UIView {

    let viewModel = ViewModel()
    let titleTopImage = UILabel()
    let subtitleTopImage = UILabel()
    let imageViewProject = UIImageView()
    let labelExplanationProject = UILabel()

    override func drawRect(rect: CGRect) {
        self.addSubview(self.titleTopImage)
        self.addSubview(self.subtitleTopImage)
        self.addSubview(self.imageViewProject)
        self.addSubview(self.labelExplanationProject)
    }
}
