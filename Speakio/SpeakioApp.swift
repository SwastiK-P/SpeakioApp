
import SwiftUI
import TipKit
@main
struct SpeakioApp: App {
    @StateObject var AppInfo = AppInformation()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppInfo)
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)])
                }
        }
    }
}
