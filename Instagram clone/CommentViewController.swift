//
//  CommentViewController.swift
//  Instagram clone
//
//  Created by 山崎大聖 on 2017/04/26.
//  Copyright © 2017年 山崎大聖. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    var commentData = [[String:String]]()
    
    var postData:PostData!
    
   var commentArray:[String] = []
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBOutlet weak var backPageButton: UIButton!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {


    }
    @IBAction func backBtn(_ sender: Any) {
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
        let commentData = ["name": (FIRAuth.auth()?.currentUser?.displayName)!, "comment\n": commentTextField.text!]
        postData.comments.append(commentData)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
