import Foundation
import TipKit


struct FaceIdTip: Tip {
    var title: Text {
        Text("Face ID Authentication")
    }
    var message: Text? {
        Text("Enable for Extra layer of security")
    }
    var image: Image? {
        Image(systemName: "faceid")
    }
}
struct Changevoicetip: Tip {
    var title: Text {
        Text("Change Voice").foregroundColor(.blue)
    }
    var message: Text? {
        Text("Switch Between Different Voices")
    }
    var image: Image? {
        Image(systemName: "speaker.wave.2.bubble")
    }
}

