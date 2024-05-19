//
//  SettingsView.swift
//  New Practice
//
//  Created by Swastik Patil on 16/03/24.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @EnvironmentObject var appInfo: AppInformation
    @State private var showingmodal = false
    @State private var notificationpermission = false
    @State private var Notificationpermissionbuttonhidden = false
    @State private var notificationpermissionbuttontext = "Grant Notification Permission"
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $appInfo.changevoice) {
                    Text("Disable Voice Change")
                }.tint(.blue)
                
                Toggle(isOn: $appInfo.changeerror) {
                    Text("Show Empty Alert")
                }.tint(.blue)

                Button("Show Secret Keywords"){
                    showingmodal.toggle()
                }
                .sheet(isPresented: $showingmodal){
                    SecretKeywords()
                }
            }.navigationTitle("Settings")
                .onAppear(perform: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound], completionHandler: { success, error in
                        if success {
                            print("all set!")
                            Notificationpermissionbuttonhidden = true
                            notificationpermissionbuttontext = "Notification Permission Granted!"
                        }
                        else if let error {
                            print(error.localizedDescription)
                        }
                        
                    })
                })
                
                }
        }
    }
#Preview {
    SettingsView().environmentObject(AppInformation())
}

