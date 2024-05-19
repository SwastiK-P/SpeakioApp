//
//  SettingsView.swift
//  New Practice Watch Watch App
//
//  Created by Swastik Patil on 17/03/24.
//

import SwiftUI
struct SettingsView: View {
    @EnvironmentObject var appInfo: AppInformation
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    Toggle(isOn: $appInfo.changevoice) {
                        Text("Disable Voice Change")
                    }.tint(.blue)
                }.padding(2)
            }.containerBackground(.blue.gradient, for: .navigation)
            .navigationTitle("Settings")
               
                    
            
        }
    }
}

#Preview {
    SettingsView().environmentObject(AppInformation())
}
