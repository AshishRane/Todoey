//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Ashish Rane on 2018-08-09.
//  Copyright © 2018 Ashish Rane. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>? //categories is optional

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1 //Nil Coalescing operator
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    //MARK:-  Data Manipulation Methods
    
    
    func save(category : Category) {
        
        do {
            
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            
            print("Error saving context \(error)")
        }
        self.tableView.reloadData() //Reload data as the array now has a new value
        
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)

        tableView.reloadData()
    }
    
    //MARK:- Add New Categories
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            //what will happen once the user clicks the add category button on our UIAlert
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        
        //closure
        alert.addAction(action)
        
        alert.addTextField { (field) in
            field.placeholder = "Create new category"
            textField = field // extending the scope of alertTextField
        }
        
        
        present(alert, animated: true, completion: nil)
    }
    

}
