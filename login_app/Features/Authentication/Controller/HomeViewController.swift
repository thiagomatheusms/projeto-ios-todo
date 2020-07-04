//
//  HomeViewController.swift
//  login_app
//
//  Created by Thiago Matheus on 20/06/20.
//  Copyright © 2020 Thiago Matheus. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func addNewTodo(newTodo: Todo)
    func editTodo(newTodo: Todo)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textFieldTodo: UITextField!
    @IBOutlet weak var textFieldContent: UITextField!
    @IBOutlet weak var dateTodo: UIDatePicker!
    @IBOutlet weak var textTitle: UILabel!
    var todoSelected: Todo?
    var delegate: HomeViewControllerDelegate?
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let somedateString = dateFormatter.string(from: dateTodo.date)
        
        date = somedateString
        
        if(todoSelected != nil){
            textTitle.text = "Editar a tarefa \(todoSelected?.title ?? "")"
            textFieldTodo.text = todoSelected?.title
            textFieldContent.text = todoSelected?.content
            
            let dateString = todoSelected?.date
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let date = dateFormatter.date(from: dateString!)
            
            dateTodo.setDate(date!, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if(todoSelected == nil){
            
            todoSelected = Todo.init(title: textFieldTodo.text!, content: textFieldContent.text!, date: date!)
            
            delegate?.addNewTodo(newTodo: todoSelected!)
        } else {
            todoSelected?.title = textFieldTodo?.text! as! String
            todoSelected?.content = textFieldContent?.text! as! String
            todoSelected?.date = date!
            delegate?.editTodo(newTodo: todoSelected!)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let somedateString = dateFormatter.string(from: sender.date)
        date = somedateString
    }
}
