//
//  PersistenceManager.swift
//  foodprint-hackathon-app
//
//  Created by Sunni Tang on 12/18/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
struct PersistenceHelper<T: Codable> {
    
    func saveSingleElement(newElement: T) throws {
        var element = try getSingleElement()
        element = newElement
        let serializedData = try PropertyListEncoder().encode(element)
        try serializedData.write(to: url, options: .atomic)
    }
    
    func getSingleElement() throws -> T? {
        guard let data = FileManager.default.contents(atPath: url.path) else {return nil}
        return try PropertyListDecoder().decode(T.self, from: data)
    }
    
    func getObjects() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else { return [] }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    
    func save(newElement: T) throws {
        var elements = try getObjects()
        elements.append(newElement)
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    
    func replace(elements: [T]) throws { //Used for deletion
         let serializedData = try PropertyListEncoder().encode(elements)
         try serializedData.write(to: url, options: Data.WritingOptions.atomic)
     }
    
    func saveAtIndex(newElement: T, indexToSaveAt: Int) throws {
         var elements = try getObjects()
         elements.insert(newElement, at: indexToSaveAt)
         try replace(elements: elements)
     }

    
    init(fileName: String){
        self.fileName = fileName
    }
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    private func filePathFromDocumentsDirectory(name: String) -> URL {
        return documentsDirectory.appendingPathComponent(name)
    }
    
    private let fileName: String
    
    private var url: URL {
        return filePathFromDocumentsDirectory(name: fileName)
    }
}
