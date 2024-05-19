//
//  SwiftUIView.swift
//  SpeakioMac
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI
import AVFoundation

struct MenuView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                TextField("Enter Text and click Speak Below", text: $text2)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .frame(width: 250)
                
                Button(action: {
                    
                    if text2.isEmpty {
                        
                        
                       
                        
                        
                    } else {
                        
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Rishi-compact")
                        
                        synthsizer.speak(utterance)
                        
                        
                    }
                    
                }) {
                    
                    Text("Speak")
                 
                }
              Spacer()
            }
            .padding()
            .navigationTitle("Text to Speech")
        }
    }
}


#Preview {
    MenuView()
}

