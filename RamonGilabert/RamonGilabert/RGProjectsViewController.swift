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

        prepareCards()
    }

    // MARK: Cards

    func prepareCards() {
        let dictionary = self.arrayWithProjects[0] as NSDictionary

        let labelTitle = self.viewModel.setTitleProject(self.mainView)
        let labelSubtitle = self.viewModel.setSubtitleProject(self.mainView)
        let imageBackground = self.viewModel.setImageViewProject(self.mainView)
        let labelExplanation = self.viewModel.setExplanationProject(self.mainView)
        
        self.backgroundImageView.image = UIImage(named: dictionary["image"] as! String)
    }
}
