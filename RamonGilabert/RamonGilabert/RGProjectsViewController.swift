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
        let imageName = dictionary["image"] as! String

        self.viewModel.setTitleProject(self.mainView, text: dictionary["title"] as! String)
        self.viewModel.setSubtitleProject(self.mainView, text: dictionary["position"] as! String)
        self.viewModel.setImageViewProject(self.mainView, image: imageName)
        self.viewModel.setExplanationProject(self.mainView, text: dictionary["text"] as! String)

        self.backgroundImageView.image = UIImage(named: "\(imageName)-blur")
    }
}
