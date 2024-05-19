
import SwiftUI

@main
struct SpeakioApp: App {
    @StateObject var AppInfo = AppInformation()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppInfo)
        }
    }
}
