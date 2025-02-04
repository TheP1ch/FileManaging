//
//  FileManagerCSV.swift
//
//  Created by Евгений Беляков on 19.06.2024.
//

import Foundation

public protocol FileManagingCSV: AnyObject {
    func saveCSVFile(named fileName: String, data csvString: String) throws
    func loadCSVFile(named fileName: String) throws -> String
}

public final class FileManagerCSV: FileManagingCSV {
    
    public init() {}
    
    public func saveCSVFile(named fileName: String, data csvString: String) throws {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).csv") else {
            throw FileError.invalidFileURL
        }

        try csvString.write(to: fileUrl, atomically: true, encoding: .utf8)
    }

    public func loadCSVFile(named fileName: String) throws -> String {
        guard let fileUrl = FileManager.getFileUrl(fileName: "\(fileName).csv") else {
            throw FileError.invalidFileURL
        }

        let data: Data = try Data(contentsOf: fileUrl)

        let csvStr = String(decoding: data, as: UTF8.self)

        return csvStr
    }
}
