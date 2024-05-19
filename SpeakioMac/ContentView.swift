//
//  ContentView.swift
//  SpeakioMac
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    @State private var voices = true
    @State private var isalertshown = false
    @State var istoggled = false
    @State private var iseastereggtshown = false
    @FocusState private var iskeyboard: Bool
    @EnvironmentObject var appInfo: AppInformation
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                ZStack(alignment: .trailing){
                    TextField("Enter Text and click Speak Below", text: $text2)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .frame(width: 250)
                        .focused($iskeyboard)
                    
                    if !text2.isEmpty {
                        Button {
                            text2 = ""
                        }label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.trailing, 2)
                    }
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
                        
                        }
                    else if text2 == "Easter egg" {
                        iseastereggtshown = true
                        
                        let utterance = AVSpeechUtterance(string: "WowwW you found an easter egg find it above")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                    }
                    else if text2 == "System" {
                        iseastereggtshown = false
                        
                        let utterance = AVSpeechUtterance(string: "Elvish Bhai ke aage koi bol sakta hai kya, AAaaa")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                    } else {
                        
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                        
                    }
                    
                }) 
                {
                    
                Text("Speak")
                }
                
                .alert(isPresented: $isalertshown) {
                    
                    Alert(title: Text("Error"), message: Text("Please input text in the above field"), dismissButton: .default(Text("OK")))
                    
                }
                Spacer()
                Text("Current Voice: " + String(voices ? "Rishi": "Veena"))
            
                Picker(selection: $voices, label: Text("")){
                    Text("Rishi").tag(true)
                    Text("Veena").tag(false)
                }.pickerStyle(.segmented)
                 .disabled(appInfo.changevoice)
        
                .frame(width: 240)
                Toggle("Show Menu Bar Item", isOn: $istoggled)
                
            }
            .padding()
            .navigationTitle("Speakio")
            .frame(width: 250, height: 150)
        }
    }



#Preview {
    ContentView()
        
}
class AppInformation: ObservableObject {
    @Published var changevoice: Bool = false
    @Published var changeerror: Bool = false
    @Published var showingmodal = false
}
