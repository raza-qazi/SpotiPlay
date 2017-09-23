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
    var a = SpotifyAppleScript()
    
    // Create new popover for icon
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Configure status bar icon to initialize and apply an 'action'
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("status_play"))
        
            // Open popover
            button.action = #selector(togglePopover(_:))
        }
        
        // Show whatever is setup in 'SpotiPlayViewController'
        popover.contentViewController = SpotiPlayViewController.freshController()
        self.constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func playMusic() {
        print("Play option selected")
        a.playPauseTrack()
    }
    
    func constructMenu() {
        let menu = NSMenu() // Create a new menu
        menu.addItem(withTitle: "Play/Pause current track", action: #selector(self.playMusic), keyEquivalent: "p") // Add the option to play/pause current track
        menu.addItem(NSMenuItem.separator()) // Add a separator between new menu items
        menu.addItem(NSMenuItem(title: "Quit SpotiPlay", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")) // Add option to close application
        
        statusItem.menu = menu
    }
    
    // Toggles the popover
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            // Close popover if currently open
            popover.performClose(sender)
        }
        // Displays popover to user. Displays the popover relative to button location
        else {
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}

