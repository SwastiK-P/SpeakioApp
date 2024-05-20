//
//  ContentView.swift
//  New Practice
//
//  Created by Swastik Patil on 19/02/24.
//

import SwiftUI
import LocalAuthentication

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
                print(UserDefaults.standard.Authentication)
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
