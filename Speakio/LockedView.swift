//
//  LockedView.swift
//  Speakio
//
//  Created by Swastik Patil on 19/05/24.
//

import SwiftUI

struct LockedView: View {
    var body: some View {
        VStack {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            Text("Locked")
                .font(.title)
        }
    }
}

#Preview {
    LockedView()
}
