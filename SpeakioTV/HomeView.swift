//
//  HomeView.swift
//  SpeakioTV
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    
    @State private var voices = true
    @State private var  isalertshown = false
    @FocusState private var iskeyboard: Bool
  
    @EnvironmentObject var appInfo: AppInformation
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                    TextField("Enter Text and click Speak", text: $text2)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                        .multilineTextAlignment(.leading)
                        .submitLabel(.done)
                        .focused($iskeyboard)
                    
                
                
                Button(action: {
                    
                    if text2.isEmpty {
                        if appInfo.changeerror == false {
                            iskeyboard = true
                            
                        }
                        else {
                            isalertshown = true
                            
                            
                        }
                  
                        }
                   
                    else if text2 == "Easter egg" {

                        
                        let utterance = AVSpeechUtterance(string: "WowwW you found an easter egg find it above")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                    }
                    else if text2 == "System" {
                        
                        
                        let utterance = AVSpeechUtterance(string: "Elvish Bhai ke aage koi bol sakta hai kya, AAaaa")
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                    }
               
                    else {
                        
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.veena-compact")
                        
                        synthsizer.speak(utterance)
                        
                        
                    }
                    
                }) {
                    
                    Text("Speak")
                        .font(.title3)
                        
                        .frame(width: 230)
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
            }
            .padding()
                .navigationTitle("Speakio")
                
                    
                }
            
        }
    }
    #Preview {
        HomeView()
            .environmentObject(AppInformation())

    }

