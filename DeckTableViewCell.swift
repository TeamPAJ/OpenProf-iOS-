//
//  DeckTableViewCell.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 06/04/2021.
//

import UIKit



class DeckTableViewCell: UITableViewCell {
    
    @IBOutlet weak var choiceButton : UIButton!
    @IBOutlet weak var imageCard : UIImageView!
    
    @IBOutlet weak var lifeImage : UIImageView!
    @IBOutlet weak var attackImage : UIImageView!
    @IBOutlet weak var nameImage : UIImageView!
    
    @IBOutlet weak var life : UILabel!
    @IBOutlet weak var attack : UILabel!
    @IBOutlet weak var name : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

}
