//
//  DetailViewController.swift
//  ProjectDB
//
//  Created by Aisyah on 05/02/23.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    let moc = DataController().managedObjectContext
    var getUser = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query: NSFetchRequest<TestDB> = TestDB.fetchRequest()
               query.predicate = NSPredicate(format: "username == %@", "\(getUser)")
               do {
                   let data = try moc.fetch(query)
                   if let idL = data[0].value(forKey: "id") as? Int {
                       idLbl.text = "\(idL)"
                   }
                   if let nameL = data[0].value(forKey: "name") as? String {
                       nameLbl.text = nameL
                   }
                   if let unameL = data[0].value(forKey: "username") as? String {
                       usernameLbl.text = unameL
                   }
                   if let passL = data[0].value(forKey: "password") as? String {
                       passwordLbl.text = passL
                   }
                   if let statusL = data[0].value(forKey: "status") as? String {
                       statusLbl.text = "\(statusL)"
                   }

               } catch {
                   print("Not Data")
               }

    }
    
    @IBAction func delBtn(_ sender: Any) {
        let query: NSFetchRequest<TestDB> = TestDB.fetchRequest()
               query.predicate = NSPredicate(format: "username == %@", "\(getUser)")
               do {
                   let data = try moc.fetch(query)
                   for object in data {
                        moc.delete(object)
                    }
                   try moc.save()

               } catch {
                   print("Not Data")
               }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
