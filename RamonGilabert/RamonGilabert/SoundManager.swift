import UIKit
import AVFoundation

struct Sound {
    static let MenuDisplayURL: NSURL = NSBundle.mainBundle().URLForResource("menu-display", withExtension: "wav")!
    static let MenuTapURL: NSURL = NSBundle.mainBundle().URLForResource("menu-tap", withExtension: "wav")!
    static let MainScrollURL: NSURL = NSBundle.mainBundle().URLForResource("main-scrolling", withExtension: "wav")!
}

class SoundManager: NSObject {

    let menuDisplaySound = AVAudioPlayer(contentsOfURL: Sound.MenuDisplayURL, error: nil)
    let menuTappedSound = AVAudioPlayer(contentsOfURL: Sound.MenuTapURL, error: nil)
    let mainScrolling = AVAudioPlayer(contentsOfURL: Sound.MainScrollURL, error: nil)
}
