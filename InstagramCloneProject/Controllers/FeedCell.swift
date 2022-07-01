//
//  FeedCell.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 2.07.2022.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var documentIDLabel: UILabel! //Hidden
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var isLiked:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabese = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            if isLiked == true{
                let likeStore = ["likes": likeCount - 1] as [String: Any]
                
                fireStoreDatabese.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true) // merge means just change the given direction
                
                isLiked = false
                
            }
            else{
                let likeStore = ["likes": likeCount + 1] as [String: Any]
                
                fireStoreDatabese.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true) // merge means just change the given direction
                isLiked = true
            }
            
            
            

        }
    }
}
