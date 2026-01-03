//
//  Logger+App.swift
//  TCC
//
//  Created by Felipe Ribeiro on 02/01/26.
//

import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let fileImporter = Logger(subsystem: subsystem, category: "fileImporter")
    
    static let mlPipeline = Logger(subsystem: subsystem, category: "mlPipeline")
    
    static let persistence = Logger(subsystem: subsystem, category: "persistence")
    
    static let tips = Logger(subsystem: subsystem, category: "tips")
}
