//
//  HomeView.swift
//  New Practice Watch Watch App
//
//  Created by Swastik Patil on 17/03/24.
//

import SwiftUI
import AVFoundation

struct HideViewModifier: ViewModifier {
    let isHidden: Bool
    @ViewBuilder func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}

extension View {
    func hide(if isHiddden: Bool) -> some View {
        ModifiedContent(content: self,
                        modifier: HideViewModifier(isHidden: isHiddden)
        )
    }
}
struct HomeView: View {
    @State private var text2 = ""
    let synthsizer = AVSpeechSynthesizer()
    @State private var voices = false
    @State private var current_voice = true
    @State private var  isalertshown = false
    var systemImage: String = "checkmark"
    var activeColor: Color = .blue
    
    @EnvironmentObject var appInfo: AppInformation
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                TextField("Enter Text", text: $text2)
                    .textFieldStyle(.automatic)
                    .autocorrectionDisabled()
                    .padding(.vertical, 3)
                
                Button(action: {
                    
                    if text2.isEmpty {
                        
                        isalertshown = true
                        WKInterfaceDevice.current().play(.success)
                        
                        
                    } else {
                        
                        let utterance = AVSpeechUtterance(string: text2)
                        
                        utterance.voice = AVSpeechSynthesisVoice(identifier: voices ? "com.apple.ttsbundle.veena-compact": "com.apple.ttsbundle.Rishi-compact" )
                        
                        synthsizer.speak(utterance)
                        
                        
                    }
                    
                })
                {
                    
                    Text("Speak")
                    
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    
                    
                }
                
                
                
                
                
                
                .alert(isPresented: $isalertshown) {
                    
                    Alert(title: Text("Error"), message: Text("Please input text in the above field"), dismissButton: .default(Text("OK")))
                    
                }
                Spacer()
                if voices == true {
                    Text("Voice: Veena")
                }
                else {
                    Text("Voice: Rishi")
                }
                
                Toggle(isOn: $voices) {
                    Text("Change voice")
                }.toggleStyle(.automatic)
                    .hide(if: appInfo.changevoice)
                
                
                
                
                
            }.containerBackground(.white.gradient, for: .navigation)
                .padding()
                .navigationTitle("Speakio")
            
        }
    }
    
    
    #Preview {
        ContentView().environmentObject(AppInformation())
    }
   
    
    
    
}
