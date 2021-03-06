import UIKit

class RGWebViewController: UIViewController, UIWebViewDelegate {

    let viewModel = ViewModel()
    let transitionManager = CustomVideoTransition()
    var webView = UIWebView()
    var loadURL = ContactWebs.Website!
    var backButton = UIButton()
    var forwardButton = UIButton()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager

        let headerView = UIView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight/9))
        headerView.backgroundColor = UIColor_WWDC.almostBlackColor()

        self.viewModel.setCrossButtonWebView(headerView, viewController: self)
        self.backButton = self.viewModel.setBackButton(headerView, viewController: self)
        self.forwardButton = self.viewModel.setForwardButton(headerView, viewController: self)
        self.webView = self.viewModel.setWebView(self.view, webViewDelegate: self)

        self.view.addSubview(headerView)

        let requestURL = NSURLRequest(URL: self.loadURL)
        self.webView.loadRequest(requestURL)
    }

    // MARK: WebView delegate methods

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        self.backButton.enabled = self.webView.canGoBack ? true : false
        self.forwardButton.enabled = self.webView.canGoForward ? true : false

        return true
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        self.backButton.enabled = self.webView.canGoBack ? true : false
        self.forwardButton.enabled = self.webView.canGoForward ? true : false
    }

    // MARK: Button handlers

    func onCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func onBackButtonPressed(sender: UIButton) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }

    func onForwardButtonPressed(sender: UIButton) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
}
