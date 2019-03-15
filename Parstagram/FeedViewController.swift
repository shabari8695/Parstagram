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
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        
        let p = post[indexPath.row]
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
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
