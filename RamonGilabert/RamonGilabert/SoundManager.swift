import UIKit
import AVFoundation

struct Sound {
    static let MenuDisplayURL: NSURL = NSBundle.mainBundle().URLForResource("menu-display", withExtension: "wav")!
    static let MenuTapURL: NSURL = NSBundle.mainBundle().URLForResource("menu-tap", withExtension: "wav")!
    static let DismissTipURL: NSURL = NSBundle.mainBundle().URLForResource("dismiss-tips", withExtension: "wav")!
}

class SoundManager: NSObject {

    let menuDisplaySound = AVAudioPlayer(contentsOfURL: Sound.MenuDisplayURL, error: nil)
    let menuTappedSound = AVAudioPlayer(contentsOfURL: Sound.MenuTapURL, error: nil)
    let dismissTips = AVAudioPlayer(contentsOfURL: Sound.DismissTipURL, error: nil)
}
