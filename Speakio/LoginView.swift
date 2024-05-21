//
//  LoginView.swift
//  Speakio
//
//  Created by Swastik Patil on 21/05/24.
//

import SwiftUI
import UserNotifications

struct LoginView: View {
    @EnvironmentObject var appInfo: AppInformation
    let impactRigid = UIImpactFeedbackGenerator(style: .rigid)
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ZStack(alignment: .trailing){
                    TextField("Username", text: $appInfo.username)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.continue)
                    .autocorrectionDisabled()
                    .frame(width: 350)
                    if !appInfo.username.isEmpty {
                        Button {
                            appInfo.username = ""
                        }label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.trailing, 4)
                    }
                }.padding(3)
                ZStack(alignment: .trailing){
                    SecureField("Password", text: $appInfo.password)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.return)
                    .keyboardType(.numberPad)
                    .frame(width: 350)
                    if !appInfo.password.isEmpty {
                        Button {
                            appInfo.password = ""
                        }label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.trailing, 4)
                    }
                }.padding(3)
                Button("Enter             ")
                {
                    if appInfo.username == "Test" && appInfo.password == "1234" {
                        appInfo.loginsheetshown = false
                        UserDefaults.standard.loginsheetshow = true
                        let content = UNMutableNotificationContent()
                        content.title = "Speakio"
                        content.subtitle = "Enjoy Aplha Acess"
                        content.sound = UNNotificationSound.default
                                                            
                         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 120, repeats: false)
                         let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                         UNUserNotificationCenter.current().add(request)
                    }
                    else {
                        appInfo.isalertshownlogin = true
                        appInfo.username = ""
                        appInfo.password = ""
                    }
                    impactRigid.impactOccurred()
                }.buttonStyle(.borderedProminent)
                    .alert(isPresented: $appInfo.isalertshownlogin) {
                        
                     Alert(title: Text("Error"), message: Text( "You Entered Incorrect Credentials"), dismissButton: .destructive(Text("Retry")))
                    }
                Spacer()
                Text("Version 1.0 (alpha)")
                    .opacity(0.4)
                }
            .navigationTitle("login")
             
        }
    }
}

#Preview {
    LoginView()
}
