//
//  SettingsView.swift
//  SpeakioTV
//
//  Created by Swastik Patil on 18/03/24.
//
import SwiftUI
struct SettingsView: View {
    @EnvironmentObject var appInfo: AppInformation
    @State private var showingmodal = false
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $appInfo.changevoice) {
                    Text("Disable Voice Change")
                }.tint(.blue)
                Toggle(isOn: $appInfo.changeerror) {
                    Text("Show Empty Alert")
                }.tint(.blue)
                    
                
                
                
            }.navigationTitle("Settings")
                
                }
        }
    }
#Preview {
    SettingsView().environmentObject(AppInformation())
}
