//
//  HiddenFilesSwitch.swift
//  OnlySwitch
//
//  Created by Jacklandrin on 2021/12/8.
//

import Foundation

class HiddenFilesSwitch:SwitchProvider {
    static let shared = HiddenFilesSwitch()
    func currentInfo() -> String {
        return ""
    }
    func currentStatus() -> Bool {
        let result = getHiddenFilesStateCMD.runAppleScript(isShellCMD: true)
        if result.0 {
            return (result.1 as! NSString).boolValue
        }
        return false
    }
    
    func isVisable() -> Bool {
        return true
    }
    
    func operationSwitch(isOn: Bool) async -> Bool {
        if isOn {
            return setHiddenFilesShowCMD.runAppleScript(isShellCMD: true).0
        } else {
            return setHiddenFilesHideCMD.runAppleScript(isShellCMD: true).0
        }
    }
}
