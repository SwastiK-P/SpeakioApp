//
//  SpeakioMacApp.swift
//  SpeakioMac
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI

@main
struct SpeakioMacApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var AppInfo = AppInformation()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppInfo)
                
        }
        Settings {
            SettingsView().environmentObject(AppInfo)
        }
        
    }
}
    class AppDelegate: NSObject, NSApplicationDelegate {
        static private (set) var instance: AppDelegate!
        lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let menu = ApplicationMenuView()
        func applicationDidFinishLaunching(_ notification: Notification) {
            AppDelegate.instance = self
            statusBarItem.button?.image = NSImage (named: "quote.bubble")
            statusBarItem.button?.imagePosition = .imageLeading
            statusBarItem.menu = menu.createMenu()
        }
    }

