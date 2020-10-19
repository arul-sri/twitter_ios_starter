//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Arul Srivastava on 10/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeed:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favotiteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("fav didnt suckseecd \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoutiteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("unfav didnt suckseecd \(error)")
            })
        }
        
        
        
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            
                   self.setRetweeted(true)
            
               }, failure: { (error) in
                
                   print("Error is suckseecd: \(error)")
                
               })
    }
    
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
           if (isRetweeted) {
               retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
               retweetButton.isEnabled = false
           } else {
               retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
               retweetButton.isEnabled = true
           }
       }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
