//
//  taskTableTableViewCell.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class taskTableViewCell: UITableViewCell {

    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var tasktitleLabel: UILabel!
    @IBOutlet weak var completeByDateLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
