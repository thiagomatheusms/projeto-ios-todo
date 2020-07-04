//
//  TodoHomeTableViewController.swift
//  login_app
//
//  Created by Thiago Matheus on 02/07/20.
//  Copyright © 2020 Thiago Matheus. All rights reserved.
//

import UIKit

class TodoHomeTableViewController: UITableViewController {
    
    var todoList = [Todo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        
        do {
            let storedObjItem = UserDefaults.standard.object(forKey: "listTodo")
            if(storedObjItem != nil) {
                let storedItems = try JSONDecoder().decode([Todo].self, from: storedObjItem as! Data)
                print("Retrieved items: \(storedItems)")
                todoList.append(contentsOf: storedItems)
            }
        } catch let err {
            print(err)
        }
        
        //todoList = UserDefaults.standard.object(forKey: "listTodo") as? [Todo] ?? [Todo]()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let todo = todoList[indexPath.row]
//        cell.textLabel?.text = todo.title
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        
        let todo = todoList[indexPath.row]
        cell.prepare(with: todo)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeViewControler = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        let indexSelected = tableView.indexPathForSelectedRow!.row
        
        homeViewControler.todoSelected = todoList[indexSelected]
        homeViewControler.delegate = self
        navigationController?.pushViewController(homeViewControler, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            todoList.remove(at: indexPath.row)
            
            if let encoded = try? JSONEncoder().encode(todoList) {
                UserDefaults.standard.set(encoded, forKey: "listTodo")
            }
            
            tableView.reloadData()
        }
    }
    
    @IBAction func addTodoButtonPressed(_ sender: Any) {
        let homeViewControler = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewControler.delegate = self
        navigationController?.pushViewController(homeViewControler, animated: true)
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TodoHomeTableViewController: HomeViewControllerDelegate {
    func addNewTodo(newTodo: Todo) {
        
        todoList.append(newTodo)
        
        if let encoded = try? JSONEncoder().encode(todoList) {
            UserDefaults.standard.set(encoded, forKey: "listTodo")
        }
        
        
        
//        todoList.append(newTodo)
//        let defaults = UserDefaults.standard
//        defaults.set(todoList, forKey: "listTodo")
    }
    
    func editTodo(newTodo: Todo) {
        self.todoList[tableView.indexPathForSelectedRow!.row] = newTodo
        if let encoded = try? JSONEncoder().encode(todoList) {
            UserDefaults.standard.set(encoded, forKey: "listTodo")
        }
    }
}
