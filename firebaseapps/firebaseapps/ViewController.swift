//
//  ViewController.swift
//  firebaseapps
//
//  Created by MAC2 on 06/04/1946 Saka.
//

import UIKit
import FirebaseAuth
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var txt_username: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_new: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homevc = self.storyboard?.instantiateViewController(withIdentifier: "homevc") as! homeViewController
        self.navigationController?.pushViewController(homevc, animated: true)
    }
    @IBAction func btn_login(_ sender: Any)
    {
        if self.txt_username.text == "" || self.txt_password.text == "" {
                
                //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
                
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            
            } else {
                
                Auth.auth().signIn(withEmail: self.txt_username.text!, password: self.txt_password.text!) { (user, error) in
                    
                    if error == nil {
                        
                        //Print into the console if successfully logged in
                        print("You have successfully login")
                        
                        //Go to the HomeViewController if the login is sucessful
                    
                        //self.present(vc!, animated: true, completion: nil)
                        let homevc = self.storyboard?.instantiateViewController(withIdentifier: "homevc") as! homeViewController
                        self.navigationController?.pushViewController(homevc, animated: true)
                        
                    } else {
                        
                        //Tells the user that there is an error and then gets firebase to tell them the error
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        
    }
    
    @IBAction func btn_new(_ sender: Any)
    {
        
            let signup = storyboard?.instantiateViewController(identifier: "signupvc") as! signupViewController
            navigationController?.pushViewController(signup, animated: true)
    }
    
}

