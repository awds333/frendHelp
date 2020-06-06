//
//  ViewController.swift
//  Task1.6
//
//  Created by Pavel Bandiuk on 23.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var students = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "studentCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Students")
        
        do
        {
            students = try managedObjectContext.fetch(fetchRequest) as!
                [NSManagedObject]
        }
        catch let error as NSError
        {
            print("Data loading error: \(error)")
        }
        
        
        
        self.tableView.reloadData()
    }
    
    @IBAction func addStudentButton(_ sender: Any) {
        if studentNameTextField.text == "" || studentNameTextField.text == "Введите данные!"
        {
            studentNameTextField.text = "Введите данные!"
        }
        else
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = appDelegate.persistentContainer.viewContext //Создаем
            
            let newObject =
                NSEntityDescription.insertNewObject(forEntityName: "Students",
                                                    into: managedObjectContext) as NSManagedObject //Создаем
            
            newObject.setValue(studentNameTextField.text!, forKey: "name")
            
            do
            {
                try managedObjectContext.save()
                students.append(newObject)
                studentNameTextField.text! = "" //Очищаем текстовое поле
                self.tableView.reloadData() //Обновляем содержимое таблицы
                self.view.endEditing(true)
            }
            catch let error as NSError
            {
                print("Data saving error: \(error)") //В случае возникновения ошибки,
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell")! as UITableViewCell
        let student = students[indexPath.row]
        cell.textLabel?.text = student.value(forKey: "name") as? String
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //Создаем ссылку на класс AppDelegate из файла AppDelegate.swift
            let managedObjectContext = appDelegate.persistentContainer.viewContext //Создаем
            managedObjectContext.delete(students[indexPath.row] as
                NSManagedObject) //Выбираем метод удаления объекта из модели данны
            do
            {
                try managedObjectContext.save()
                students.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left) //Удаляем строку из таблицы
            }
            catch let error as NSError
            {
                print("Data removing error: \(error)")
            }
        }
    }
    
    
    
    
}

