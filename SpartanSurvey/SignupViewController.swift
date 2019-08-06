//
//  SignupViewController.swift
//  SpartanSurvey
//
//  Created by Yonas1234 on 4/18/18.
//  Copyright © 2018 SJSU. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var repeatPassword: UITextField!
    
    @IBOutlet var info: UILabel!
    
    
    @IBAction func cancel(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signupTologin", sender: self)
    
    }
    
    
    @IBAction func signup(_ sender: UIButton) {
        
        if username.text != "" && password.text != "" && repeatPassword.text != "" {
            if password.text != repeatPassword.text {
                info.text = "Passwords Not Matching!"
                return
            }
            Auth.auth().createUser(withEmail: username.text!, password: password.text!) { (user, error) in
                
                if user != nil {
                    self.performSegue(withIdentifier: "signupToHome", sender: self)
                }
                else {
                    print(error.debugDescription + "Can not signup")
                    self.info.text = "Please use valid Email format and Password must be atleast 6 characters!"
                }
                
            }
        }
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
