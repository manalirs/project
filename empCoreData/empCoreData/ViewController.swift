//
//  ViewController.swift
//  empCoreData
//
//  Created by Yuj-admin-mac02 on 13/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   var array = [String]()
    var array1 = [String]()
    var array2 = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    @IBOutlet weak var tableview1: UITableView!
    
    @IBOutlet weak var txtSalary: UITextField!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as!TableViewCell
        cell.name1.text = array[indexPath.row]
        cell.no1.text = array1[indexPath.row]
        cell.salary1.text = array2[indexPath.row]
        return cell
    }
    
    
    let delegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var no: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func insert(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext;
        let empObject:NSObject = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        
        empObject.setValue(self.no.text, forKey: "employeeno")
        empObject.setValue(self.name.text, forKey: "employeename")
       
        let formater=NumberFormatter()
      let sal  = formater.number(from: self.txtSalary.text!) as! Double
        empObject.setValue(sal, forKey: "salary")
        do
        {
            try context.save()
        }
        catch
        {
            print("Error")
        }
        print("Insert:Success")
        readFromCoreData()
        tableview1.reloadData()
    
    

    }
    
    
    @IBAction func delet(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext;
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.predicate = NSPredicate(format: "employeename = %@", self.name.text!)
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            if result.count == 1
            {
                let myObject:NSManagedObject = result.first!as! NSManagedObject
                context.delete(myObject)
                do{
                    try context.save()
                }
                catch
                {
                    print(error.localizedDescription)
                }
                print("Delete: Success")
                readFromCoreData()
                tableview1.reloadData()

            }
            
        }catch
        {
            print(error.localizedDescription)
        }
        
        

    }
    
    @IBAction func update(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext;
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.predicate = NSPredicate(format: "employeeno = %@", self.no.text!)
        request.returnsObjectsAsFaults = false
        do{
             let result = try context.fetch(request)
            if result.count == 1
            {
                let myObject:NSManagedObject = result.first!as! NSManagedObject
                myObject.setValue(no.text, forKey: "employeeno")
             myObject.setValue(self.name.text, forKey: "employeename")
                let formater=NumberFormatter()
                let sal  = formater.number(from: self.txtSalary.text!) as! Double
                myObject.setValue(sal, forKey: "salary")

                
                do{
                    try context.save()
                }
                catch
                {
                     print(error.localizedDescription)
                }
                print("Update: Success")
                readFromCoreData()
                tableview1.reloadData()

            }
            
        }catch
        {
            print(error.localizedDescription)
        }
        
      
    
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as! TableViewCell
        
        
        let str = cell.name1.text
        let str1 = cell.no1.text
        let str2 = cell.salary1.text
        name.text = str
        no.text = str1
        txtSalary.text = str2
        

    }
    
    func readFromCoreData()
    {   array = [String]()
          array1 = [String]()
        array2 = [String]()
        
        let context = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        do{
            
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]{
                    let str = data.value(forKey: "employeename")as! String
                    let str1 = data.value(forKey: "employeeno")as! String
                    let str2 = data.value(forKey: "salary")as! Double
                    array.append(str)
                    array1.append(str1)
                    array2.append(String(str2))
                    
                    print(str)
                }
        }
                catch
                {
                    print(error.localizedDescription)
                }
        
    }
    override func viewDidLoad() {
        readFromCoreData()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

