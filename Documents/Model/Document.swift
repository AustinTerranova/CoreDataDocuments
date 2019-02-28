//
//  Document.swift
//  Documents
//
//  Created by Dale Musser on 6/7/18.
//  Copyright © 2018 Dale Musser. All rights reserved.
//

//import Foundation
//
//struct Document {
//    let url: URL
//    let name: String
//    let size: UInt64
//    let modificationDate: Date
//
//    var content: String? {
//        get {
//            return try? String(contentsOf: url, encoding: .utf8)
//        }
//        
//        
//    }
//    
//    convenience init?(name: String?, content: String?) {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate //UIKit is needed to access UIApplication
//        guard let managedContext = appDelegate?.persistentContainer.viewContext,
//            let name = name, name != "" else {
//                return nil
//        }
//        self.init(entity: Document.entity(), insertInto: managedContext)
//        self.name = name
//        self.content = content
//        if let size = content?.count {
//            self.size = Int64(size)
//        } else {
//            self.size = 0
//        }
//        
//        self.modifiedDate = Date(timeIntervalSinceNow: 0)
//    }
//
//}

