import UIKit

class RGSkillsViewController: UIViewController {

    let viewModel = ViewModel()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = self.viewModel.initChildScrollViewsInView(self.view)
        self.scrollView.backgroundColor = UIColor.greenColor()
    }
}
