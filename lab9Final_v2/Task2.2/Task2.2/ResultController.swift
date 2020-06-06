//
//  ResultController.swift
//  Task2.2
//
//  Created by Pavel Bandiuk on 22.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

import UIKit
import CoreData

class ResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let cellid = "cellid"
    var structArray = [Museum]()
    
    var title_send:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        self.view.addSubview(tableView)
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structArray.count //return places.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! UITableViewCell
        
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
        reuseIdentifier: cellid)
        cell.textLabel?.text = structArray[indexPath.row].name
        cell.detailTextLabel?.text = structArray[indexPath.row].address
        
        return cell
      }
    
    
      func getData(){
          let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
          
          request.returnsObjectsAsFaults = false
          
          do {
              let result = try context.fetch(request)
                
              for data in result as! [NSManagedObject] {
                  let city = data.value(forKey: "city") as! String
                  let name = data.value(forKey: "name") as! String
                  let lan = data.value(forKey: "lan") as! Double
                  let lat = data.value(forKey: "lat") as! Double
                  let address = data.value(forKey: "address") as! String
                
                    if title_send ?? "error" == city {
                        let museum = Museum(name: name, city: city, lat: lat, lan: lan, address: address)
                        if title_send ?? "error" == "Brest" || title_send ?? "error" == "Брест" {
                            self.navigationItem.title = "11 C"
                        }
                        if title_send ?? "error" == "Polotsk" || title_send ?? "error" == "Полоцк" {
                            self.navigationItem.title = "10 C"
                        }
                        if title_send ?? "error" == "Vitsyebsk" || title_send ?? "error" == "Витебск" {
                            self.navigationItem.title = "10 C"
                        }
                        else {
                            self.navigationItem.title = "12 C"
                        }
                        structArray.append(museum)
                    }
                
              }
           
          } catch {
              print("Failed")
          }
      }
    


}
