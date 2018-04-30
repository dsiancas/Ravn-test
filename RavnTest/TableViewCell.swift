//
//  TableViewCell.swift
//  RavnTest
//
//  Created by Daniel Siancas on 4/30/18.
//  Copyright © 2018 Daniel Siancas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var bookLabel: UILabel!
    
    var book: Book! {
        didSet {
            updateUI()
        }
    }
        
    private func updateUI(){
        self.bookLabel.text = book.title
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
