//
//  ViewController.swift
//  Parstagram
//
//  Created by Shabari Girish Ganapathy on 3/14/19.
//  Copyright © 2019 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {

    @IBOutlet weak var passwordfield: UITextField!
    @IBOutlet weak var usernamefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernamefield.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernamefield.text
        user.password = passwordfield.text
        
        user.signUpInBackground{(success,error) in
            if success{
                self.performSegue(withIdentifier: "loginseg", sender: self)
            }else{
                print("error during signup \(error?.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernamefield.text!
        let password = passwordfield.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginseg", sender: self)
            }else{
                print("error during login \(error?.localizedDescription)")
            }
        }
        
    }
}

