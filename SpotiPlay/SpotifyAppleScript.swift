//
//  SpotifyAppleScript.swift
//  SpotiPlay
//
//  Created by Raza Qazi on 2017-09-18.
//  Copyright © 2017 Raza Qazi. All rights reserved.
//

import Foundation
import Cocoa

public class SpotifyAppleScript {
    private let AppleScriptFunctions =
                """
                on getCurrentlyPlayingTrack()
                    tell application "Spotify"
                        set currentTrack to name of current track as string
                        return currentTrack
                    end tell
                end getCurrentlyPlayingTrack

                on getCurrentlyPlayingArtist()
                    tell application "Spotify"
                        set currentArtist to artist of current track as string
                        return currentArtist
                    end tell
                end getCurrentlyPlayingArtist

                on getCurrentlyPlayingAlbum()
                    tell application "Spotify"
                        set currentAlbum to album of current track as string
                        return currentAlbum
                    end tell
                end getCurrentlyPlayingAlbum

                on getCurrentlyPlayingAlbumArtURL()
                    tell application "Spotify"
                        set albumURL to artwork url of current track as string
                        return albumURL
                    end tell
                end getCurrentlyPlayingAlbumArtURL

                on playPauseTrack()
                    tell application "Spotify"
                        playpause
                    end tell
                end playPauseTrack
                
                on nextTrack()
                    tell application "Spotify"
                        next track
                    end tell
                end nextTrack

                on prevTrack()
                    tell application "Spotify"
                        previous track
                    end tell
                end prevTrack
                \n
                """
    
    public func getCurrentPlayingTrack() -> String {
        let cmd = "getCurrentlyPlayingTrack()"
        return runAppleScript(appleScript: AppleScriptFunctions + cmd)
    }
    
    public func playPauseTrack() {
        let cmd = "playPauseTrack()"
        runAppleScript(appleScript: AppleScriptFunctions + cmd)
    }
    
    public func runAppleScript(appleScript: String) -> String {
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: appleScript) {
            if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(&error) {
                print(output.stringValue ?? "No Output")
            } else if (error != nil) {
                print("error: \(String(describing: error))")
            }
        }
        return "fatal error"
    }
}
