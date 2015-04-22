import UIKit

class RGProjectsViewController: UIViewController {

    let viewModel = ViewModel()
    let arrayWithProjects = Projects.ArrayWithProjects
    var scrollView = UIScrollView()
    var mainView = UIView()
    var backgroundImageView = UIImageView()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImageView = self.viewModel.setBackgroundProjects(self.view)
        self.mainView = self.viewModel.setMainView(self.view)
    }

    // MARK: Cards

    func prepareCards() {
        let dictionary = self.arrayWithProjects[0] as NSDictionary
        self.backgroundImageView.image = dictionary["image"]
        
    }
}
