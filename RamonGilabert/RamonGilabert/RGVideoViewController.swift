import AVFoundation
import MediaPlayer
import UIKit

class RGVideoViewController: UIViewController {

    let session = AVAudioSession.sharedInstance()
    var moviePlayerController = MPMoviePlayerController()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let fileURL: NSURL = NSBundle.mainBundle().URLForResource("intro_video", withExtension: "m4v")!

        self.session.setCategory(AVAudioSessionCategoryPlayback, error: nil)

        self.moviePlayerController = MPMoviePlayerController(contentURL: fileURL)
        self.moviePlayerController.scalingMode = MPMovieScalingMode.AspectFill
        self.moviePlayerController.controlStyle = MPMovieControlStyle.None
        self.moviePlayerController.backgroundView.backgroundColor = UIColor(red:0.11, green:0.1, blue:0.11, alpha:1)
        self.moviePlayerController.repeatMode = MPMovieRepeatMode.None
        self.moviePlayerController.view.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.moviePlayerController.allowsAirPlay = true
        self.moviePlayerController.prepareToPlay()
        self.view.addSubview(self.moviePlayerController.view)
        self.view.bringSubviewToFront(self.moviePlayerController.view)
        self.moviePlayerController.play()

        let crossButton = UIButton(frame: CGRectMake(20, 20, 28, 28))
        crossButton.addTarget(self, action: "onCrossButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        crossButton.setBackgroundImage(UIImage(named: "cross-button-shadow"), forState: UIControlState.Normal)
        self.view.addSubview(crossButton)
    }

    // MARK: UIButton handler

    func onCrossButtonPressed() {
        self.moviePlayerController.pause()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
