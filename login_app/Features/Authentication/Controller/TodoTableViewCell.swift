//
//  TodoTableViewCell.swift
//  login_app
//
//  Created by Thiago Matheus on 04/07/20.
//  Copyright © 2020 Thiago Matheus. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepare(with todo: Todo) {
        lbTitle.text = todo.title
        lbContent.text = todo.content
        lbDate.text = todo.date
        
    }
    
}
