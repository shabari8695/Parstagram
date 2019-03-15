//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Shabari Girish Ganapathy on 3/14/19.
//  Copyright © 2019 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    var post = [PFObject]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let p = post[indexPath.row]
        let comments = (p["comments"] as? [PFObject]) ?? []
        
            let cell = tableview.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
            
            let user = p["author"] as! PFUser
            cell.namelabel.text = user.username
            cell.commentlabel.text = p["caption"] as! String
            
            
            let imagefile = p["image"] as! PFFileObject
            let urlstring = imagefile.url!
            let url = URL(string: urlstring)!
            
            cell.photoview.af_setImage(withURL: url)
            
            return cell

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("loading data")
        let query = PFQuery(className: "Posts")
        query.includeKeys(["author","comments","comments.author"])
        query.limit = 20
        
        query.findObjectsInBackground{(posts,error) in
            if posts != nil{
                self.post = posts!
                self.tableview.reloadData()
            }else{
                print("error")
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p = post[indexPath.row]
        let comment = PFObject(className: "comments")
        comment["text"] = "this is a random comment"
        comment["post"] = p
        comment["author"] = PFUser.current()!
        
        p.add(comment, forKey: "comment")
        
        p.saveInBackground{(success,error) in
            if success{
                print("comment saved")
            }else{
                print("error saving comment")
            }
            
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let feedviewcontroller = main.instantiateViewController(withIdentifier: "homeviewcontroller")
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = feedviewcontroller

        
    }
    
}
