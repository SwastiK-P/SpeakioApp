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
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
            Text("Locked")
                .fontWeight(.semibold)
                .font(.title)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    LockedView()
}
