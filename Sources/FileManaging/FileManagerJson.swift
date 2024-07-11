//
//  FileManagerJson.swift
//
//  Created by Евгений Беляков on 19.06.2024.
//

import Foundation

public protocol FileManagingJson: AnyObject {
    func saveJsonFile(named fileName: String, json: Any) throws
    func loadJsonFile(named fileName: String) throws -> Any
    
    func load(fileName: String) throws -> Data
    func save(fileName: String, json: Data) throws
}

public final class FileManagerJson: FileManagingJson {
    
    public func loadJsonFile(named fileName: String) throws -> Any {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).json") else {
            throw FileError.invalidFileURL
        }

        let data: Data = try Data(contentsOf: fileUrl)

        return try JSONSerialization.jsonObject(with: data)

    }

    public func load(fileName: String) throws -> Data {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).json") else {
            throw FileError.invalidFileURL
        }

        let data: Data = try Data(contentsOf: fileUrl)

        return data
    }

    func save(fileName: String, json: Data) throws {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).json") else {
            throw FileError.invalidFileURL
        }

        try json.write(to: fileUrl)
    }

    func saveJsonFile(named fileName: String, json: Any) throws {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).json") else {
            throw FileError.invalidFileURL
        }

        let data: Data = try JSONSerialization.data(withJSONObject: json)

        try data.write(to: fileUrl)
    }
}

