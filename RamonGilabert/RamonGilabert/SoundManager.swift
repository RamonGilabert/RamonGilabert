import UIKit
import AVFoundation

struct Sound {
    static let MenuDisplayURL: NSURL = NSBundle.mainBundle().URLForResource("menu-display", withExtension: "wav")!
}

class SoundManager: NSObject {

    func setupAudioPlayerWithFile(soundURL: NSURL) -> AVAudioPlayer {
        let session = AVAudioSession()
        session.setCategory(AVAudioSessionCategoryPlayback, error: nil)

        let audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)

        audioPlayer.prepareToPlay()
        audioPlayer.play()

        return audioPlayer
    }
}
