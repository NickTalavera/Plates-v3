//
//  Document.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/22/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

