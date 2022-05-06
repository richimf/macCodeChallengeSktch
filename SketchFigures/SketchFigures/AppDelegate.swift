//
//  AppDelegate.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private let fileManager = PanelHelper()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    @IBAction func openFile(_ sender: Any) {
        fileManager.openFile()
    }
    
    @IBAction func save(_ sender: Any) {
        fileManager.saveFile()
    }

    @IBAction func saveAs(_ sender: Any) {
        fileManager.saveAs()
    }
}

