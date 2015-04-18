import UIKit

class RGStoryViewController: UIViewController {

    let viewModel = ViewModel()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = self.viewModel.initChildScrollViewsInView(self.view)
    }
}
