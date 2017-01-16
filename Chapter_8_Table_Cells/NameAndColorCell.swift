//
//  NameAndColorCell.swift
//  Chapter_8_Table_Cells
//
//  Created by Wei Li on 16/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    var name: String = "" {
        didSet {
            if (name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if (color != oldValue) {
                colorLabel.text = color
            }
        }
    }
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    /*override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRectMake(0, 5, 70, 15)
        let nameMaker = UILabel(frame: nameLabelRect)
        nameMaker.textAlignment = NSTextAlignment.Right
        nameMaker.text = "Name:"
        nameMaker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(nameMaker)
        
        let colorLabelRect = CGRectMake(0, 26, 70, 15)
        let colorMaker = UILabel(frame: colorLabelRect)
        colorMaker.textAlignment = NSTextAlignment.Right
        colorMaker.text = "Color:"
        colorMaker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(colorMaker)
        
        let nameValueRect = CGRectMake(80, 5, 200, 15)
        nameLabel = UILabel(frame: nameValueRect)
        contentView.addSubview(nameLabel)
        
        let colorValueRect = CGRectMake(80, 25, 200, 15)
        colorLabel = UILabel(frame: colorValueRect)
        contentView.addSubview(colorLabel)
    }
    
    required init(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
