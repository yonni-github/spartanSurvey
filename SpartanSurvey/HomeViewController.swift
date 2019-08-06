//
//  ViewController.swift
//  SpartanSurvey
//
//  Created by Yonas on 4/16/18.
//  Copyright © 2018 SJSU. All rights reserved.
//

import UIKit
import  FirebaseAuth
import GoogleSignIn
import  FBSDKLoginKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.displayName ?? "Logged In")
            // ...
        }
        else if GIDSignIn.sharedInstance().currentUser != nil {
            print(GIDSignIn.sharedInstance().currentUser.userID)
            // ...
        }
        else if FBSDKAccessToken.current() != nil {
            print(FBSDKAccessToken.current())
            // ...
        }else {
            self.performSegue(withIdentifier: "toLogin", sender: self)
        }
    }

    @IBAction func logout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //GIDSignIn.sharedInstance().signOut()
            
            self.performSegue(withIdentifier: "toLogin", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            
        }
         
    }
    
    
    @IBAction func createSurvey(_ sender: UIButton) {
        
        
        
    }
    
}

