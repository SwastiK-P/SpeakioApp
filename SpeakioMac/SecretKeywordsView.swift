//
//  SecretKeywordsView.swift
//  Speakio
//
//  Created by Swastik Patil on 18/03/24.
//

import SwiftUI

struct SecretKeywordsView: View {
    private var text = "Easter egg"
    private var text2 = "System"
    private var text3 = "Easter egg"
    private var text4 = "Easter egg"
    @State private var ispopover = false
    @EnvironmentObject var appInfo: AppInformation
    private let pasteboard = NSPasteboard.general
    var body: some View {
        
        NavigationStack {
           
            VStack {
                
                
                    HStack {
                        Text("Easter egg")
                        Spacer()
                        Button("Copy") {
                            copyfunc()
                        }
                    }.padding(.horizontal)
                    HStack {
                    Text("System")
                    Spacer()
                    Button("Copy") {
                        copyfunc2()
                    }
                        
                    }.padding(.horizontal)
                    Button("Dismiss") {
                        appInfo.showingmodal = false
                    }
                        }
                .frame(alignment: .center)
                .navigationTitle("Secret Keywords")
                .frame(width: 200, height: 100)
                
            
                }
            }
    func copyfunc() {
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
func copyfunc2() {
    pasteboard.clearContents()
    pasteboard.setString(text2, forType: .string)
}
        }
        

    
    #Preview {
        SecretKeywordsView().environmentObject(AppInformation())
    }
