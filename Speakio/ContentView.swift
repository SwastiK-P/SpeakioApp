//
//  ContentView.swift
//  New Practice
//
//  Created by Swastik Patil on 19/02/24.
//

import SwiftUI
import LocalAuthentication
import UserNotifications

struct ContentView: View {
    @StateObject var appInfo = AppInformation()
    @Environment(\.scenePhase) var scenePhase
    @State private var shouldlockedviewappear = false
    @State private var islockedviewappeared = false
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {Label("Home", systemImage: "house")}
                
                SettingsView()
                    .tabItem {Label("Settings", systemImage: "gear")}
                
            }
            .onAppear(perform: {
                if UserDefaults.standard.Authentication == true {
                    shouldlockedviewappear = true
                }
                else if UserDefaults.standard.Authentication == false {
                    shouldlockedviewappear = false
                }
            })
            .environmentObject(appInfo)
            .onChange(of: scenePhase) { currentphase in
                if currentphase == .active {
                    print("active")
                    if islockedviewappeared == true {
                        authenticate()
                    }
                    else {
                        
                    }
                }
                else if currentphase == .inactive {
                    if shouldlockedviewappear == true {
                        islockedviewappeared = true
                    }
                    print("inactive")
                    
                }
                else if currentphase == .background {
                    let content = UNMutableNotificationContent()
                    content.title = "Hey👋🏻"
                    content.subtitle = "We are missing you"
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                    if shouldlockedviewappear == true {
                        islockedviewappeared = true
                    }
                    print("background")
                }
            }
            .sheet(isPresented: $islockedviewappeared, content: {
                LockedView().interactiveDismissDisabled()
                
            })
    }
    func authenticate()
    {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "we need to unlcok your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationerror in
                if success {
                    islockedviewappeared = false
                }
                else {
                   islockedviewappeared = true
                }
            }
        }
        else {
            
        }
    }
        }
#Preview {
    ContentView()
}
class AppInformation: ObservableObject {
    @Published var changevoice: Bool = false
    @Published var changeerror: Bool = false
}
