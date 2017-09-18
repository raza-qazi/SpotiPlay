//
//  AppDelegate.swift
//  SpotiPlay
//
//  Created by Raza Qazi on 2017-09-17.
//  Copyright © 2017 Raza Qazi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // Property: Create a new status item (icon) in the menu bar with a fixed-length
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Configure status bar icon to initialize and apply an 'action'
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("status_play"))
            //button.action = #selector(printQuote(_:))
        }
        self.constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func playMusic() {
        print("Play option selected")
        
        let appleScript = "tell application id \"com.spotify.client\" \n playpause \n end tell"
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: appleScript) {
            if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(&error) {
                print(output.stringValue ?? "No Output")
            } else if (error != nil) {
                print("error: \(String(describing: error))")
            }
        }
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(withTitle: "play/pause current track", action: #selector(self.playMusic), keyEquivalent: "p")
        
        statusItem.menu = menu
    }
}

