//
//  ContentView.swift
//  New Practice
//
//  Created by Swastik Patil on 19/02/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var appInfo = AppInformation()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {Label("Home", systemImage: "house")}
                
            SettingsView()
                .tabItem {Label("Settings", systemImage: "gear")}
                
        }.environmentObject(appInfo)
    }
}
#Preview {
    ContentView()
}
class AppInformation: ObservableObject {
    @Published var changevoice: Bool = false
    @Published var changeerror: Bool = false
}
