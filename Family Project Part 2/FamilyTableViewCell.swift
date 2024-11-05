//
//  FamilyTableViewCell.swift
//  Family Project Part 2
//
//  Created by Kaylen Ward on 10/31/24.
//

import UIKit

class FamilyTableViewCell: UITableViewCell {

    @IBOutlet weak var familyMemberEmoji: UILabel!
    
    @IBOutlet weak var familyMemberNameLabel: UILabel!
    
    
    func update(with familyMember: FamilyMember) {
        familyMemberEmoji.text = familyMember.emoji
        familyMemberNameLabel.text = familyMember.name
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
