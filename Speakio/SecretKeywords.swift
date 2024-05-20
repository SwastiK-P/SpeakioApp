

import SwiftUI


struct SecretKeywords: View {
    @EnvironmentObject var appInfo: AppInformation
    let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    private let pasteboard = UIPasteboard.general
    private var text = "Easter egg"
    private var text2 = "System"
    @State private var Bottomtext = "Tap Copy and Paste it in Home"
    @State private var ispopover = false
   
    var body: some View {
        NavigationView {
            
            VStack {
                
                List {
                    HStack {
                        Text("Easter egg")
                        Spacer()
                        Text("Copy")
                            .foregroundStyle(Color.blue)
                            .onTapGesture {
                                copyfunc()
                                impactMedium.impactOccurred()
                                Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { (_) in
                                    withAnimation {
                                        Bottomtext = "Copied!"
                                    }
                                }
                                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
                                    withAnimation {
                                        Bottomtext = "Tap Copy and Paste it in Home"
                                    }
                                }
                                    }
                                }
                    HStack {
                        Text("System")
                        Spacer()
                        Text("Copy")
                            .foregroundStyle(Color.blue)
                            .onTapGesture {
                                copyfunc2()
                                impactMedium.impactOccurred()
                                Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { (_) in
                                    withAnimation {
                                        Bottomtext = "Copied!"
                                    }
                                }
                                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
                                    withAnimation {
                                        Bottomtext = "Tap Copy and Paste it in Home"
                                    }
                                }
                            }
                    }
                    
                }
                VStack{
                    Text(Bottomtext).fontWeight(.medium)
                }.padding(10)
            }
                .navigationBarTitle("Secret Keywords", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button("Close") {
                            appInfo.showingsecretkeywordmodal = false
                        }
                        
                    })
                }
                
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
        SecretKeywords().environmentObject(AppInformation())
    }
    
    

