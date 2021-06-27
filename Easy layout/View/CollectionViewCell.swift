//
//  CollectionViewCell.swift
//  Easy layout
//
//  Created by Nitanta Adhikari on 6/26/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CollectionViewCell"
    
    @IBOutlet weak var numberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
