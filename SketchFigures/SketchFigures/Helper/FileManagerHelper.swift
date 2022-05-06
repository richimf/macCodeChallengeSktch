//
//  FileManagerHelper.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class FileManagerHelper {

    private let key: String = "enableFileMenuItems"
    private let fileExtension: String = "frijolito"
    private var fileURL: URL? // This stores the selected url path of an opened file

    /// This function open existing file and write content
    func saveFile<T: Encodable>(contents object: T) {
        if self.fileURL == nil {
            saveAs(contents: object)
        } else {
            guard let fileWithExtensionURL = self.fileURL else { return }
            let fileManager = FileManager.default
            if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                writeJson(object: object, fileWithExtensionURL)
            }
        }
    }

    /// This function creates and saves data into a new file
    func saveAs<T: Encodable>(contents object: T) {
        let panel = setupOpenPanel(message: "Choose path...",
                                   prompt: "Choose",
                                   canChooseFiles: false, canChooseDirectories: true, canCreateDirectories: true)
        panel.begin() { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let savePanel = self.setupSavePanel()
                let fileManager = FileManager.default
                savePanel.begin() { (result) -> Void in
                    if result == NSApplication.ModalResponse.OK {
                        guard let fileWithExtensionURL = savePanel.url else { return }
                        self.fileURL = fileWithExtensionURL
                        // Check if File does not exists, create file
                        if !fileManager.fileExists(atPath: fileWithExtensionURL.path) {
                            fileManager.createFile(atPath: fileWithExtensionURL.path, contents: nil, attributes: nil)
                        }
                        // Once created the file, write data into it
                        if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                            self.writeJson(object: object, fileWithExtensionURL)
                        }
                    }
                }
            }
        }
    }
    
    /// Reads a selected file
    func openFile(completion: @escaping (ShapeMirrorStack) -> ()) {
        let panel = setupOpenPanel(message: "Choose file with \".\(fileExtension)\" format",
                                   prompt: "Open",
                                   canChooseFiles: true, canChooseDirectories: true, canCreateDirectories: false)
        panel.begin() { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                let fileManager = FileManager.default
                guard let fileWithExtensionURL = panel.url else { return }
                self.fileURL = fileWithExtensionURL
                if fileManager.isReadableFile(atPath: fileWithExtensionURL.path) {
                    do {
                        let data = try Data(contentsOf: fileWithExtensionURL)
                        let jsonData = try JSONDecoder().decode(ShapeMirrorStack.self, from: data)
                        completion(jsonData)
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
        savePanel.allowedFileTypes = [self.fileExtension]
        return savePanel
    }
    
    private func writeJson<T: Encodable>(object: T, _ fileWithExtensionURL: URL) {
        do {
            let data = try JSONEncoder().encode(object)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                print("error json string")
                return }
            try jsonString.write(to: fileWithExtensionURL, atomically: false, encoding: .utf8)
        } catch {
            print("cant save file as")
        }
    }
}
