//
//  ListViewController.swift
//  ProjectDB
//
//  Created by Aisyah on 05/02/23.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tbView: UITableView!
    
    
    let moc = DataController().managedObjectContext
    var data = [TestDB]()
    var sendUser = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tbView.reloadData()
    }
    
    func fetchData() {
        let query: NSFetchRequest<TestDB> = TestDB.fetchRequest()
             do {
                 data = try moc.fetch(query)
                 tbView.reloadData()
             } catch {
                 print("Not Data")
             }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return data.count
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
         
         if let uname = data[indexPath.row].value(forKey: "name") as? String {
             cell.usernameLbl.text = uname
         }
         return cell
         
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         let transfer = segue.destination as! DetailViewController
         transfer.getUser = sendUser
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         if let trans = data[indexPath.row].value(forKey: "username") as? String {
             sendUser = trans
         }
        
         performSegue(withIdentifier: "show", sender: nil)

     }


}
