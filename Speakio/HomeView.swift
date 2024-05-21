//version 1.0 (aplha)

import SwiftUI
import AVFoundation
import UserNotifications
import TipKit
extension UserDefaults {
var loginsheetshow: Bool {
        get {
            return(UserDefaults.standard.value(forKey: "loginsheetshown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "loginsheetshown")
        }
    }
var Authentication: Bool {
            get {
                return(UserDefaults.standard.value(forKey: "Authentication") as? Bool) ?? false
            }
            set {
                UserDefaults.standard.setValue(newValue, forKey: "Authentication")
            }
        }
    var Changeerror: Bool {
                get {
                    return(UserDefaults.standard.value(forKey: "changeerror") as? Bool) ?? false
                }
                set {
                    UserDefaults.standard.setValue(newValue, forKey: "changeerror")
                }
            }
    var Changevoice: Bool {
                get {
                    return(UserDefaults.standard.value(forKey: "changevoice") as? Bool) ?? false
                }
                set {
                    UserDefaults.standard.setValue(newValue, forKey: "changevoice")
                }
            }
    
} // UserDefaults Data


struct HomeView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    let impactRigid = UIImpactFeedbackGenerator(style: .rigid)
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    @State private var voices = true
    @State private var isalertshown = false
    @State private var isalertshownlogin = false
    @State private var iseastereggtshown = false
    @State private var username = ""
    @State private var password = ""
    @FocusState private var iskeyboard: Bool
    @EnvironmentObject var appInfo: AppInformation
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                ZStack(alignment: .trailing){
                    
                    TextField("Enter Text and click Speak", text: $text2)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                        .multilineTextAlignment(.leading)
                        .submitLabel(.done)
                        .focused($iskeyboard)
                    if !text2.isEmpty {
                        Button {
                            text2 = ""
                        }label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.trailing, 4)
                    }
                }.padding(3)
                Button(action: {
                    
                    if text2.isEmpty {
                        if appInfo.changeerror == false {
                            iskeyboard = true
                            iseastereggtshown = false
                        }
                        else {
                            isalertshown = true
                            iseastereggtshown = false
                        }
                        impactHeavy.impactOccurred()
                        }
                    else if text2 == "Easter egg" {
                        iseastereggtshown = true
                        
                        let utterance = AVSpeechUtterance(string: "WowwW you found an easter egg find it above")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        impactRigid.impactOccurred()
                        
                    }
                    else if text2 == "System" {
                        iseastereggtshown = false
                        
                        let utterance = AVSpeechUtterance(string: "Elvish Bhai ke aage koi bol sakta hai kya, AAaaa")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        impactRigid.impactOccurred()
                    }
                    
                    else {
                        iseastereggtshown = false
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        impactRigid.impactOccurred()
                        
                    }
                    
                }) {
                    
                    Text("Speak")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 230, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                }
                .alert(isPresented: $isalertshown) {
                    
                     Alert(title: Text("Error"), message: Text("Please input text in the above field"), dismissButton: .default(Text("OK")))
                    
                    }
                    Spacer()
                    Text("Current Voice: " + String(voices ? "Rishi": "Veena"))
                    Menu {
                        Picker(selection: $voices, label: Text("Changevoice")){
                            Text("Veena").tag(false)
                            Text("Rishi").tag(true)
                        }
                    }
                label: {
                    Text("Change Voice")
                }.disabled(appInfo.changevoice)
                 .popoverTip(Changevoicetip())
                }
                .padding()
                .onAppear(perform: {
                    
                    if UserDefaults.standard.loginsheetshow == true {
                        appInfo.loginsheetshown = false
                    }
                    else {
                        appInfo.loginsheetshown = true
                    }
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound], completionHandler: { success, error in
                                if success {
                                    print("all set!")
                                }
                                else if let error {
                                    print(error.localizedDescription)
                        }
                    })
                })
                .sheet(isPresented: $appInfo.loginsheetshown, content: {
                    LoginView().interactiveDismissDisabled(true)
                })
                .navigationTitle("Text to Speech")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Link(destination: URL(string: "https://swastik.craft.me/7eyHH5i3UlaOTp")!, label: {
                            Image(systemName: "sparkles")
                                .opacity(iseastereggtshown ? 1 : 0)
                                
                        }).disabled(iseastereggtshown == false)
                    })
                }
            }
        }
    }

    #Preview {
        HomeView()
            .task {
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)])
            }
            .environmentObject(AppInformation())

    }
