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
               
                
                }
        }
    }
#Preview {
    SettingsView().environmentObject(AppInformation())
}

