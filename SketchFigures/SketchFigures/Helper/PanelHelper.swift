//
//  FileManagerHelper.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class PanelHelper {

    private let extensionTypeName: String = "frijolito"
    private let key: String = "enableFileMenuItems"

    /// This function open existing file and write content
    func saveFile(contents data: Data? = nil) {
        let content = "some contet from saveFile"
        let panel = setupOpenPanel(message: "Choose file with \".\(extensionTypeName)\" format",
                                   prompt: "Save",
                                   canChooseFiles: true, canChooseDirectories: true, canCreateDirectories: false)
        panel.begin()  { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let fileManager = FileManager.default
                guard let fileWithExtensionURL = panel.url else { return }
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
        let panel = setupOpenPanel(message: "Choose path...",
                                   prompt: "Save as",
                                   canChooseFiles: false, canChooseDirectories: true, canCreateDirectories: true)
        panel.begin() { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let savePanel = self.setupSavePanel()
                let fileManager = FileManager.default
                savePanel.begin() { (result) -> Void in
                    if result == NSApplication.ModalResponse.OK {
                        guard let fileWithExtensionURL = savePanel.url else { return }
                        // Check if File does not exists, create file
                        if !fileManager.fileExists(atPath: fileWithExtensionURL.path) {
                            fileManager.createFile(atPath: fileWithExtensionURL.path, contents: data, attributes: nil)
                        }
                        // Once created the file, write data into it
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
        let panel = setupOpenPanel(message: "Choose file with \".\(extensionTypeName)\" format",
                                   prompt: "Open",
                                   canChooseFiles: true, canChooseDirectories: true, canCreateDirectories: false)
        panel.begin()  { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let fileManager = FileManager.default
                guard let fileWithExtensionURL = panel.url else { return }
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
    
    private func setupOpenPanel(message: String, prompt: String, canChooseFiles: Bool, canChooseDirectories: Bool, canCreateDirectories: Bool) -> NSOpenPanel {
        let openPanel = NSOpenPanel()
        openPanel.message = NSLocalizedString(message, comment: key)
        openPanel.prompt = NSLocalizedString(prompt, comment: key)
        openPanel.canChooseFiles = canChooseFiles
        openPanel.canChooseDirectories = canChooseDirectories
        openPanel.canCreateDirectories = canCreateDirectories
        return openPanel
    }
    
    private func setupSavePanel() -> NSSavePanel {
        let savePanel = NSSavePanel()
        savePanel.title = NSLocalizedString("Save file as...", comment: key)
        savePanel.nameFieldStringValue = ""
        savePanel.prompt = NSLocalizedString("Create", comment: key)
        savePanel.allowedFileTypes = [self.extensionTypeName]
        return savePanel
    }
}
