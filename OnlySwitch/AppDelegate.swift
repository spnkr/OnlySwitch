//
//  OnlySwitchApp.swift
//  OnlySwitch
//
//  Created by Jacklandrin on 2021/11/29.
//

import SwiftUI
import Cocoa

@main
struct OnlySwitchApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            EmptyView().frame(width: 0, height: 0)
        }
    }
}


class AppDelegate:NSObject, NSApplicationDelegate {
    var statusBar: StatusBarController?
    var popover = NSPopover()
    let switchVM = SwitchVM()
    var blManager:BluetoothDevicesManager?
    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
            .environmentObject(switchVM)
        popover.contentSize = NSSize(width: 360, height: 610)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBar = StatusBarController(popover)
        blManager = BluetoothDevicesManager.shared
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        
    }
    
    
}
