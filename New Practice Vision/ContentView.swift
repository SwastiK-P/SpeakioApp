//
//  ContentView.swift
//  New Practice Vision
//
//  Created by Swastik Patil on 26/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVFAudio

struct ContentView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    @State private var voices = true
    @State private var current_voice = true
    @State private var  isalertshown = false
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                TextField("Enter Text and click Speak Below", text: $text2)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.leading)
                    .frame(width: 350)
                
                Button(action: {
                    
                    if text2.isEmpty {
                        isalertshown = true
                    } else {
                        
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.Rishi-compact": "com.apple.ttsbundle.Lekha-compact")
                        
                        synthsizer.speak(utterance)
                        
                    }
                    
                }) {
                    
                    Text("Speak")
                }.frame(depth: 0.7)
                
                .alert(isPresented: $isalertshown) {
                    
                    Alert(title: Text("Error"), message: Text("Please input text in the above field"), dismissButton: .default(Text("OK")))
                    
                }
                Spacer()
                Text("Current Voice: " + String(current_voice ? "Rishi": "Lekha"))
                Menu {
                    Button {
                        voices = true
                        current_voice = true
                    }
                label: {
                    Text("Rishi")
                }
                    Button {
                        voices = false
                        current_voice = false
                    }
                label: {
                    Text("Lekha")
                }
                }
            label: {
                Text("Change Voice")
            }
            }
            .padding()
            .navigationTitle("Text to Speech")
        }
    }
}
#Preview(windowStyle: .automatic) {
    ContentView()
        

}
