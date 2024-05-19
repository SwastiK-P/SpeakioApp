

import SwiftUI

struct SecretKeywords: View {
    private let pasteboard = UIPasteboard.general
    private var text = "Easter egg"
    private var text2 = "System"
    @State private var ispopover = false
   
    var body: some View {
        NavigationView {
           
            VStack {
                
                List {
                    Text("Easter egg")
                        .swipeActions {
                            Button() {copyfunc()}
                            
                        label: {
                            Label("Copy", systemImage: "doc.on.doc")
                        }.tint(.blue)
                        }
                    Text("System")
                        .swipeActions {
                            Button() {copyfunc2()}
                            
                        label: {
                            Label("Copy", systemImage: "doc.on.doc")
                        }.tint(.blue)
                        }
                }
                HStack {
                    Text("Swipe from right to copy").fontWeight(.medium)
                    Image(systemName: "arrow.left")
                    Image(systemName: "arrow.left")
                    Image(systemName: "arrow.left")
                    
                }.padding(10)
            }.navigationBarTitle("Secret Keywords", displayMode: .inline)
            
        }
        
    }
        func copyfunc() {
            pasteboard.string = self.text
        }
    func copyfunc2() {
        pasteboard.string = self.text2
    }
    }
    
    #Preview {
        SecretKeywords()
    }
    
    

