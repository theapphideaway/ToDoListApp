//
//  CategoryViewController.swift
//  ToDoListApp
//
//  Created by ian schoenrock on 11/13/18.
//  Copyright © 2018 ian schoenrock. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var categoryArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]

        cell.textLabel?.text = category.name
        
        return cell
    }

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var alertText = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = alertText.text!
            
            self.categoryArray.append(newCategory)
            
            self.saveItems()
            
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Add new category"
            alertText = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        do{
            try context.save()
        }catch{
            print("Error saving context")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){

        do{
            categoryArray = try context.fetch(request)
        } catch {
            print("Error")
        }

        tableView.reloadData()
    }
    
}
