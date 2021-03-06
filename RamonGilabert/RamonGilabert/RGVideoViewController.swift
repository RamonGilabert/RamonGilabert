import AVFoundation
import MediaPlayer
import UIKit

class RGVideoViewController: UIViewController {

    let session = AVAudioSession()
    let transitionManager = CustomVideoTransition()
    var moviePlayerController = MPMoviePlayerController()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager

        self.moviePlayerController = MPMoviePlayerController(contentURL: Video.MainVideoURL)
        self.moviePlayerController.view.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.view.addSubview(self.moviePlayerController.view)

        configureMoviePlayer()
        addObserverToMoviePlayer()
        crossButtonLayout()

        self.session.setCategory(AVAudioSessionCategoryPlayback, error: nil)
        self.moviePlayerController.play()
    }

    // MARK: Notification methods

    func moviePlayerDidFinishPlaying(notification: NSNotification) {
        self.session.setCategory(AVAudioSessionCategorySoloAmbient, error: nil)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(Constant.Setup.NameOfNotification, object: nil)
        })
    }

    // MARK: UIButton handler

    func onCrossButtonPressed() {
        self.moviePlayerController.pause()
        self.session.setCategory(AVAudioSessionCategorySoloAmbient, error: nil)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.moviePlayerController.stop()
            NSNotificationCenter.defaultCenter().postNotificationName(Constant.Setup.NameOfNotification, object: nil)
        })
    }

    // MARK: MoviePlayer configuration

    func crossButtonLayout() {
        let crossButton = UIButton(frame: CGRectMake(20, 20, 28, 28))
        crossButton.addTarget(self, action: "onCrossButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        crossButton.setBackgroundImage(UIImage(named: "cross-button-shadow"), forState: UIControlState.Normal)
        self.view.addSubview(crossButton)
    }

    func configureMoviePlayer() {
        self.moviePlayerController.scalingMode = MPMovieScalingMode.AspectFill
        self.moviePlayerController.controlStyle = MPMovieControlStyle.None
        self.moviePlayerController.backgroundView.backgroundColor = UIColor_WWDC.backgroundDarkGrayColor()
        self.moviePlayerController.repeatMode = MPMovieRepeatMode.None
        self.moviePlayerController.allowsAirPlay = true
        self.moviePlayerController.prepareToPlay()
    }

    func addObserverToMoviePlayer() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerDidFinishPlaying:" , name: MPMoviePlayerPlaybackDidFinishNotification, object: self.moviePlayerController)
    }
}
