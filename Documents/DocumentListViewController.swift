//
//  DocumentListViewController.swift
//  Documents
//
//  Created by Dale Musser on 6/7/18.
//  Copyright © 2018 Dale Musser. All rights reserved.
//

import UIKit
import CoreData

class DocumentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var documentsTableView: UITableView!
    
    var documents = [Document]()
    let dateFormatter = DateFormatter()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Documents"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //documents = Documents.get()
        fetchDocuments()
        documentsTableView.reloadData()
    }
    
    func fetchDocuments() {
        //get appdelegate
        //get managedcontext
        //let document = Document(name: name, content: content)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Document> = Document.fetchRequest()
//        managedContext?.fetch(fetchRequest) {
//            return documents
//        }
        
        do {
            documents = try managedContext.fetch(fetchRequest)
        } catch {
            
        }
        // create fetch request
        // managedContext.fetch(fetchRequest) -> Returns docuemtns list
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let cell = cell as? DocumentTableViewCell {
            let document = documents[indexPath.row]
            cell.nameLabel.text = document.name
            cell.sizeLabel.text = String(document.size) + " bytes"
            cell.modificationDateLabel.text = dateFormatter.string(from: document.rawModifiedDate! as Date)
        }
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let document = self.documents[indexPath.row]
            //Documents.delete(url: document.url)
            //self.documents = Documents.get()
            self.documentsTableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
 
    }
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteDocument(at: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedDocument" {
            if let destination = segue.destination as? DocumentViewController,
                let row = documentsTableView.indexPathForSelectedRow?.row {
                destination.document = documents[row]
            }
        }
    }
    
    func deleteDocument(at indexPath: IndexPath) {
        let document = documents[indexPath.row]
        
        
        if let managedContext = document.managedObjectContext {
            managedContext.delete(document)
            
            do {
                try managedContext.save()
                
                self.documents.remove(at: indexPath.row)
                
                documentsTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("Could not delete")
                documentsTableView.reloadRows(at: [indexPath], with: .automatic)
                
            }
        }
    }

}
