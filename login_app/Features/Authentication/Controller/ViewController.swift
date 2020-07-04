//
//  ViewController.swift
//  login_app
//
//  Created by Thiago Matheus on 19/06/20.
//  Copyright © 2020 Thiago Matheus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .primaryActionTriggered)
    }

    @objc
    private func signInButtonPressed(){
//        let homeViewControler = HomeViewController(nibName: "HomeViewController", bundle: nil)
//        homeViewControler.anyAttribute = "Teste"
//        homeViewControler.delegate = self
//        navigationController?.pushViewController(homeViewControler, animated: true)
        
        //Storyboard
        guard let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? HomeViewController else {
            return
        }
        
//        homeViewController.todoSelected = "Teste"
        homeViewController.delegate = self
        navigationController?.pushViewController(homeViewController, animated: true)

        
    }

}

extension ViewController: HomeViewControllerDelegate {    
    func addNewTodo(newTodo: Todo) {
        
    }
    
    func editTodo(newTodo: Todo) {
        
    }
    
//    func didBack(newTodo: String) {
//        let alertController = UIAlertController(title: "Voltar", message: "Você voltou com sucesso", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true)
//    }
}

