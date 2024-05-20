//
//  SettingsView.swift
//  New Practice
//
//  Created by Swastik Patil on 16/03/24.
//

import SwiftUI
import UserNotifications
import LocalAuthentication

struct SettingsView: View {
    @EnvironmentObject var appInfo: AppInformation
    @State private var showingmodal = false
    @State private var authentication = false
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Toggle(isOn: $appInfo.changevoice) {
                        Text("Disable Voice Change")
                    }.tint(.blue)
                    
                    Toggle(isOn: $appInfo.changeerror) {
                        Text("Show Empty Alert")
                    }.tint(.blue)
                    Toggle(isOn: $authentication) {
                        Text("Biometrics Authenticaton")
                    }.tint(.blue)
                    .onTapGesture {
                        if authentication == false {
                            UserDefaults.standard.Authentication = true
                                authenticate()
                            }
                        
                        else {
                            UserDefaults.standard.Authentication = false
                        }
                    }
                    Button("Show Secret Keywords"){
                        showingmodal.toggle()
                    }
                    .sheet(isPresented: $showingmodal){
                        SecretKeywords()
                    }
                }
            }.navigationTitle("Settings")
                .onAppear(perform: {
                    if UserDefaults.standard.Authentication == true {
                        authentication = true
                    }
                })
        }
    }
    func authenticate()
    {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "we need to unlcok your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationerror in
                if success {
                    authentication = true
                    UserDefaults.standard.Authentication = true
                    print("Biometrics Authentication Successful")
                }
                else {
                    authentication = false
                    UserDefaults.standard.Authentication = false
                    print("BioMetrics Authentication unsuccessful")
                }
            }
        }
        else {
            
        }
    }
}
#Preview {
    SettingsView().environmentObject(AppInformation())
}

