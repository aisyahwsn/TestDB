//
//  ViewController.swift
//  ProjectDB
//
//  Created by Aisyah on 05/02/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var usernameLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    
    let defaults = UserDefaults.standard
    let moc = DataController().managedObjectContext
    var inc = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLbl.text = ""
        usernameLbl.text = ""
        passwordLbl.text = ""
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        inc += 1
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TestDB", into: moc)
               entity.setValue(inc, forKey: "id")
               entity.setValue(nameLbl.text, forKey: "name")
               entity.setValue(usernameLbl.text, forKey: "username")
               entity.setValue(passwordLbl.text, forKey: "password")
               entity.setValue("true", forKey: "status")
               do {
                   try moc.save()
               
               } catch {
                   fatalError("galat \(error)")
               }
        defaults.set(inc, forKey: "idInc")
    }
}

