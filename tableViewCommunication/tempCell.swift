//
//  tempCell.swift
//  tableViewCommunication
//
//  Created by Jeisson Gonzalez on 22/02/18.
//  Copyright © 2018 Jeisson Gonzalez. All rights reserved.
//

import UIKit

class tempCell: UITableViewCell {
    
    var delegate: ViewController?
    var data:[String:Any]?

    @IBOutlet var imageBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadImage(){
        if imageBanner != nil {
            imageBanner.image=data!["image"] as? UIImage
        }
    }
    
    @IBAction func tap1(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "1")!)
        }
    }
    @IBAction func tap2(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "2")!)
        }
    }
    @IBAction func tap3(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "3")!)
        }
    }
    @IBAction func tap4(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "4")!)
        }
    }
    @IBAction func tap5(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "5")!)
        }
    }
    @IBAction func tap6(_ sender: Any) {
        if (delegate != nil) {
            delegate?.reloadImage(UIImage.init(named: "6")!)
        }
    }
    
}
