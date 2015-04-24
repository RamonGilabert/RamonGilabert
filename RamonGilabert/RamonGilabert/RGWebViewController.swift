import UIKit

class RGWebViewController: UIViewController, UIWebViewDelegate {

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

        let crossButton = UIButton(frame: CGRectMake(20, (headerView.frame.height - 30)/2, 24, 24))
        crossButton.setBackgroundImage(UIImage(named: "cross-button-image"), forState: UIControlState.Normal)
        crossButton.addTarget(self, action: "onCloseButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        headerView.addSubview(crossButton)

        self.backButton = UIButton(frame: CGRectMake(Constant.Size.DeviceWidth - 28 - 60, (headerView.frame.height - 30)/2, 14, 24))
        self.backButton.setBackgroundImage(UIImage(named: "back-button-image"), forState: UIControlState.Normal)
        self.backButton.addTarget(self, action: "onBackButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        headerView.addSubview(self.backButton)

        self.forwardButton = UIButton(frame: CGRectMake(Constant.Size.DeviceWidth - 14 - 20, (headerView.frame.height - 30)/2, 14, 24))
        self.forwardButton.setBackgroundImage(UIImage(named: "forward-button-image"), forState: UIControlState.Normal)
        self.forwardButton.addTarget(self, action: "onForwardButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        headerView.addSubview(self.forwardButton)

        self.view.addSubview(headerView)

        self.webView = UIWebView(frame: CGRectMake(0, Constant.Size.DeviceHeight/10, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight - Constant.Size.DeviceHeight/10))
        self.webView.delegate = self
        self.view.addSubview(self.webView)

        let requestURL = NSURLRequest(URL: self.loadURL)
        self.webView.loadRequest(requestURL)
    }

    // MARK: WebView delegate methods

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
