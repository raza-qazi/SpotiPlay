//
//  SpotiPlayViewController.swift
//  SpotiPlay
//
//  Created by Raza Qazi on 2017-09-18.
//  Copyright © 2017 Raza Qazi. All rights reserved.
//

import Cocoa

class SpotiPlayViewController: NSViewController {
    
    // Added an outlet for current track and artist
    @IBOutlet var textLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension SpotiPlayViewController {
    // Storyboard instantiation
    static func freshController() -> SpotiPlayViewController {
        // Get a reference to Main.storyboard.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        // Create a 'scene identifier' matching the storyboard
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "SpotiPlayViewController")
        // Instantiate 'SpotiPlayViewController' and return
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SpotiPlayViewController else {
            fatalError("Why cant i find SpotiPlayViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

extension SpotiPlayViewController {
    @IBAction func playpause(_ sender: NSButton) {
        
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}
