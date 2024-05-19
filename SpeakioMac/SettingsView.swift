//
//  SettingsView.swift
//  SpeakioMac
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appInfo: AppInformation
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Toggle(isOn: $appInfo.changevoice) {
                    Text("Disable Voice Change")
                }.tint(.blue)
                Toggle(isOn: $appInfo.changeerror) {
                    Text("Show Empty Alert")
                }.tint(.blue)
                Button("Show Secret Keywords"){
                    appInfo.showingmodal.toggle()
                }.sheet(isPresented: $appInfo.showingmodal){
                    SecretKeywordsView()
                }
                
            }.frame(width: 200, height: 80)
            .padding(10)
            .navigationTitle("Settings")
        }
    }
}
#Preview {
    SettingsView().environmentObject(AppInformation())
}
