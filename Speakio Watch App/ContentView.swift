//
//  ContentView.swift
//  New Practice Watch Watch App
//
//  Created by Swastik Patil on 19/02/24.
//
import SwiftUI
struct ContentView: View {
    @StateObject var appInfo = AppInformation()
    var body: some View {
        TabView {
            HomeView()
            SettingsView()
        }.environmentObject(appInfo)
            .tabViewStyle(.verticalPage)
    }
}
#Preview {
    ContentView()
}
class AppInformation: ObservableObject {
    @Published var changevoice: Bool = false
}
