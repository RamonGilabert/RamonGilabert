import UIKit

class RGProjectsViewController: UIViewController {

    let viewModel = ViewModel()
    var scrollView = UIScrollView()
    var mainView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView = self.viewModel.setMainView(self.view)
    }
}
