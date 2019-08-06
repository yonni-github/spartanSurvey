//
//  LoginViewController.swift
//  SpartanSurvey
//
//  Created by Yonas on 4/17/18.
//  Copyright © 2018 SJSU. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var googleButton: GIDSignInButton!
    @IBOutlet var facebookButton: FBSDKLoginButton!
    
    @IBOutlet var info: UILabel!
    
    @IBAction func login(_ sender: UIButton) {
        
        if username.text != "" && password.text != "" {
            Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
                
                if user != nil {
                    self.performSegue(withIdentifier: "toHome", sender: self)
                }
                else {
                    print(error.debugDescription + "Can not login")
                    self.info.text = "Invalid Email or Password!"
                }
                
            }
        }
        
    }
    
    @IBAction func signup(_ sender: UIButton) {
       self.performSegue(withIdentifier: "loginToSignup", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 450, width: view.frame.width - 32, height: 60)
        googleButton.backgroundColor = UIColor.gray
        view.addSubview(googleButton)
        
        facebookButton  = FBSDKLoginButton()
        facebookButton.frame = CGRect(x: 16, y: 510, width: view.frame.width - 32, height: 50)
        view.addSubview(facebookButton)

        GIDSignIn.sharedInstance().uiDelegate = self
        facebookButton.delegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        googleButton.addTarget(self, action: #selector(signInWithGoogle), for: UIControlEvents.allTouchEvents)
        
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        if GIDSignIn.sharedInstance().currentUser != nil {
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }*/
    
    @objc func signInWithGoogle(){
       if GIDSignIn.sharedInstance().currentUser != nil {
            self.performSegue(withIdentifier: "toHome", sender: self)
       }
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if FBSDKAccessToken.current() != nil{
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
