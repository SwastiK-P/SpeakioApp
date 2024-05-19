//
//  SwiftUIView2.swift
//  SpeakioMac
//
//  Created by Swastik Patil on 18/03/24.
//

import Foundation
import SwiftUI

class ApplicationMenuView: NSObject {
let menu = NSMenu()
func createMenu() -> NSMenu {
let MenuView = MenuView()
let topView = NSHostingController(rootView: MenuView)
topView.view.frame.size = CGSize(width: 275, height: 185)
let customMenuItem = NSMenuItem()
customMenuItem.view = topView.view
menu.addItem (customMenuItem)
menu.addItem(NSMenuItem.separator())
return menu
}
}
