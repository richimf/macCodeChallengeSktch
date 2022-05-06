//
//  FileManagerHelper.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class FileManagerHelper {
    
    private let extensionTypeName: String = "richie"
    private let key = "enableFileMenuItems"
    
    /// This function open existing file and write content
    func saveFile(contents data: Data? = nil) {
        let content = "some contet"
        let openPanel = NSOpenPanel()
        openPanel.message = NSLocalizedString("Choose file with \".\(extensionTypeName)\" format", comment: key)
        openPanel.prompt = NSLocalizedString("Save", comment: key)
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.begin()  { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let fileManager = FileManager.default
                guard let fileWithExtensionURL = openPanel.url else { return }
                if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                    do {
                        try content.write(to: fileWithExtensionURL, atomically: false, encoding: .utf8)
                    } catch {
                        print("cant save file as")
                    }
                }
            }
        }
    }
    
    /// This function creates and saves data into a new file
    func saveAs(contents data: Data? = nil) {
        let content = "fresh content"
        let openPanel = NSOpenPanel()
        openPanel.message = NSLocalizedString("Select folder where to save file", comment: key)
        openPanel.prompt = NSLocalizedString("Select", comment: key)
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = true
        openPanel.begin() { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let savePanel = NSSavePanel()
                savePanel.title = NSLocalizedString("Save file as...", comment: self.key)
                savePanel.nameFieldStringValue = ""
                savePanel.prompt = NSLocalizedString("Create", comment: self.key)
                savePanel.allowedFileTypes = [self.extensionTypeName]
                let fileManager = FileManager.default
                savePanel.begin() { (result) -> Void in
                    if result == NSApplication.ModalResponse.OK {
                        guard let fileWithExtensionURL = savePanel.url else { return }
                        // Check if File does not exists, create file
                        if !fileManager.fileExists(atPath: fileWithExtensionURL.path) {
                            fileManager.createFile(atPath: fileWithExtensionURL.path, contents: data, attributes: nil)
                        }
                        if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                            do {
                                try content.write(to: fileWithExtensionURL, atomically: false, encoding: .utf8)
                            } catch {
                                print("cant save file as")
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Reads a selected file
    func openFile() {
        let openPanel = NSOpenPanel()
        openPanel.message = NSLocalizedString("Choose file with \".\(extensionTypeName)\" format", comment: key)
        openPanel.prompt = NSLocalizedString("Open", comment: key)
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.begin()  { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let fileManager = FileManager.default
                guard let fileWithExtensionURL = openPanel.url else { return }
                if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                    do {
                        let content = try String(contentsOf: fileWithExtensionURL, encoding: .utf8)
                        print(content)
                    } catch {
                        print("cant open file")
                    }
                }
            }
        }
    }
}
