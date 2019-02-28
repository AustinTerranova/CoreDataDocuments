//
//  DocumentManager.swift
//  Documents
//
//  Created by Dale Musser on 6/7/18.
//  Copyright © 2018 Dale Musser. All rights reserved.
//

import Foundation
import UIKit

class Documents {
    
   
    class func delete(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
    
    class func save(name: String, content: String) {
        //let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //let url = documentsURL.appendingPathComponent(name)
//        guard let managedContext = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
        
        
        
        if let document = Document(name: name, content: content) {
            do {
                let managedContext = document.managedObjectContext
                try managedContext?.save()
            } catch {
                
            }
            
                document.update(name: name, content: content)
            
        }
        
        
        
        //let entity = Entity(size: <#T##Int64#>, name: <#T##String#>, dateModified: <#T##Date#>, content: <#T##String#>)
        
        //try? content.write(to: url, atomically: true, encoding: .utf8)
    }
}
